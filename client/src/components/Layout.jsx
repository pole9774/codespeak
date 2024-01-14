import { React, useState, useEffect } from 'react';
import { Row, Col, Button, Container, Nav, Card, Form, Modal } from 'react-bootstrap';
import { Link, useParams, useNavigate, Navigate } from 'react-router-dom';

import { LoginForm } from './Auth';
import NavHeader from './Navbar';
import API from '../API';

function MainLayout(props) {
    // State for sorting order
    const [orderBy, setOrderBy] = useState('title');
    // State for search term
    const [searchTerm, setSearchTerm] = useState('');
    // State for sorting direction (asc or desc)
    const [orderDirection, setOrderDirection] = useState('asc');

    const projects = props.projects;

    // Function to handle sorting order change event
    const handleOrderByChange = (event) => {
        setOrderBy(event.target.value);
    };

    // Function to handle search term change event
    const handleSearchChange = (event) => {
        setSearchTerm(event.target.value);
    };

    // Function to handle sorting direction change event
    const handleOrderDirectionChange = () => {
        // Toggle between 'asc' and 'desc' order
        setOrderDirection(orderDirection === 'asc' ? 'desc' : 'asc');
    };

    // Filter and sort projects based on states
    const filteredAndSortedProjects = projects
        .filter(project => project.name.toLowerCase().includes(searchTerm.toLowerCase()))
        .sort((a, b) => {
            // Compare values based on selected order and direction
            const compareValue = (orderBy === 'title') ? a.name.localeCompare(b.name) : a.description.localeCompare(b.description);
            // Multiply by 1 or -1 based on the order direction
            return orderDirection === 'asc' ? compareValue : compareValue * -1;
        });

    return (
        <>
            {/* Navigation header component */}
            <NavHeader user={props.user} />

            <Container fluid>
                <Row>
                    {/* Sidebar */}
                    <Col md={3} className="bg-light sidebar">
                        <Nav defaultActiveKey="/" className="flex-column">
                            <Nav.Link eventKey="disabled" disabled>My Projects</Nav.Link>
                        </Nav>
                    </Col>
                    {/* Main content area */}
                    <Col md={9} className="ml-sm-auto">
                        <h2>My projects</h2>

                        {/* Search and sort row */}
                        <Row>
                            {/* Search field on the left */}
                            <Col xs={6}>
                                <div>
                                    <label htmlFor="search">Search:</label>
                                    <input type="text" id="search" onChange={handleSearchChange} value={searchTerm} />
                                </div>
                            </Col>

                            {/* Sorting field and button on the right */}
                            <Col xs={6} className="text-right">
                                <div>
                                    <label htmlFor="orderBy">Order by:</label>
                                    <select id="orderBy" onChange={handleOrderByChange} value={orderBy}>
                                        <option value="title">Title</option>
                                        <option value="description">Description</option>
                                    </select>

                                    {/* Button to change sorting direction */}
                                    <button onClick={handleOrderDirectionChange}>
                                        {orderDirection === 'asc' ? 'Ascending' : 'Descending'}
                                    </button>
                                </div>
                            </Col>
                        </Row>

                        {/* List of filtered and sorted projects */}
                        {filteredAndSortedProjects.map((project) => (
                            <ProjectCard key={project.id} project={project} />
                        ))}
                    </Col>
                </Row>
            </Container>
        </>
    );
}

function ProjectCard(props) {

    return (
        <Card>
            <Card.Body>
                <Card.Title>{props.project.name}</Card.Title>
                <Card.Text>{props.project.description}</Card.Text>
                <Link to={`/projects/${props.project.id}`}>
                    <Button variant="primary">Details</Button>
                </Link>
            </Card.Body>
        </Card>
    );
}

function ProjectDetailsLayout(props) {

    const { id } = useParams();
    const projects = props.projects;

    const navigate = useNavigate();

    let name = "";
    let description = "";

    for (let project of projects) {
        if (project.id == id) {
            name = project.name;
            description = project.description;
        }
    }

    return (
        <>
            <NavHeader user={props.user} />

            <Container fluid>
                <Row>
                    <Col md={3} className="bg-light sidebar">
                        <Nav defaultActiveKey="/" className="flex-column">
                            <Nav.Link as={Link} to="/">My Projects</Nav.Link>
                            <Nav.Link eventKey="disabled" disabled>{name}</Nav.Link>
                        </Nav>
                    </Col>
                    <Col md={9} className="ml-sm-auto">
                        <Button variant="secondary" onClick={() => {
                            navigate("/");
                        }}>
                            Go Back
                        </Button>
                        <h2>{name}</h2>
                        <p>{description}</p>
                        <Link to={"/projects/" + id + "/make-question"}>
                            <Button variant="primary">Make a question</Button>
                        </Link>
                        <Link to={"/projects/" + id + "/myquestions"}>
                            <Button variant="primary">My questions</Button>
                        </Link>
                        <Link to={"/projects/" + id + "/questions"}>
                            <Button variant="primary">Other users' questions</Button>
                        </Link>
                    </Col>
                </Row>
            </Container>
        </>
    );
}

function QuestionsLayout(props) {

    const { id } = useParams();
    const [orderBy, setOrderBy] = useState('title');
    const [searchTerm, setSearchTerm] = useState('');
    const [orderDirection, setOrderDirection] = useState('asc'); 

    const navigate = useNavigate();

    const projects = props.projects;
    const questions = [];

    for (let q of props.questions) {
        if (q.projectid == id && q.userid != props.user.id) {
            questions.push(q);
        }
    }

    let name = "";

    for (let p of projects) {
        if (p.id == id) {
            name = p.name;
        }
    }
    const handleOrderByChange = (event) => {
        setOrderBy(event.target.value);
    };

    const handleSearchChange = (event) => {
        setSearchTerm(event.target.value);
    };

    const handleOrderDirectionChange = () => {
        setOrderDirection(orderDirection === 'asc' ? 'desc' : 'asc');
    };

    const filteredAndSortedQuestions= questions
        .filter(question => question.title.toLowerCase().includes(searchTerm.toLowerCase()))
        .sort((a, b) => {
            const compareValue = (orderBy === 'title') ? a.title.localeCompare(b.title) : a.description.localeCompare(b.description);
            return orderDirection === 'asc' ? compareValue : compareValue * -1;
        });

    return (
        <>
            <NavHeader user={props.user} />

            <Container fluid>
                <Row>
                    <Col md={3} className="bg-light sidebar">
                        <Nav defaultActiveKey="/" className="flex-column">
                            <Nav.Link as={Link} to="/">My Projects</Nav.Link>
                            <Nav.Link as={Link} to={"/projects/" + id}>{name}</Nav.Link>
                            <Nav.Link eventKey="disabled" disabled>Questions</Nav.Link>
                        </Nav>
                    </Col>
                    <Col md={9} className="ml-sm-auto">
                        <Button variant="secondary" onClick={() => {
                            navigate("/projects/" + id);
                        }}>
                            Go Back
                        </Button>
                        <h2>{name + " - other users' questions:"}</h2>
                        <Row>
                            <Col xs={6}>
                                <div>
                                    <label htmlFor="search">Search:</label>
                                    <input type="text" id="search" onChange={handleSearchChange} value={searchTerm} />
                                </div>
                            </Col>
                            <Col xs={6} className="text-right">
                                <div>
                                    <label htmlFor="orderBy">Order by:</label>
                                    <select id="orderBy" onChange={handleOrderByChange} value={orderBy}>
                                        <option value="title">Title</option>
                                        <option value="description">Description</option>
                                    </select>
                                    
                                    
                                    <button onClick={handleOrderDirectionChange}>
                                        {orderDirection === 'asc' ? 'Ascending' : 'Descending'}
                                    </button>
                                </div>
                            </Col>
                        </Row>
                        {
                            filteredAndSortedQuestions.map((question) =>
                                <QuestionCard key={question.id} question={question} />
                            )
                        }
                    </Col>
                </Row>
            </Container>
        </>
    );
}

function MyQuestionsLayout(props) {

    const { id } = useParams();
    const [orderBy, setOrderBy] = useState('title');
    const [searchTerm, setSearchTerm] = useState('');
    const [orderDirection, setOrderDirection] = useState('asc'); 

    const navigate = useNavigate();

    const projects = props.projects;
    const questions = [];

    for (let q of props.questions) {
        if (q.userid == props.user.id && q.projectid == id) {
            questions.push(q);
        }
    }

    let name = "";

    for (let p of projects) {
        if (p.id == id) {
            name = p.name;
        }
    }
    const handleOrderByChange = (event) => {
        setOrderBy(event.target.value);
    };

    const handleSearchChange = (event) => {
        setSearchTerm(event.target.value);
    };

    const handleOrderDirectionChange = () => {
        setOrderDirection(orderDirection === 'asc' ? 'desc' : 'asc');
    };

    const filteredAndSortedQuestions= questions
        .filter(question => question.title.toLowerCase().includes(searchTerm.toLowerCase()))
        .sort((a, b) => {
            const compareValue = (orderBy === 'title') ? a.title.localeCompare(b.title) : a.description.localeCompare(b.description);
            return orderDirection === 'asc' ? compareValue : compareValue * -1;
        });

    return (
        <>
            <NavHeader user={props.user} />

            <Container fluid>
                <Row>
                    <Col md={3} className="bg-light sidebar">
                        <Nav defaultActiveKey="/" className="flex-column">
                            <Nav.Link as={Link} to="/">My Projects</Nav.Link>
                            <Nav.Link as={Link} to={"/projects/" + id}>{name}</Nav.Link>
                            <Nav.Link eventKey="disabled" disabled>My questions</Nav.Link>
                        </Nav>
                    </Col>
                    <Col md={9} className="ml-sm-auto">
                        <Button variant="secondary" onClick={() => {
                            navigate("/projects/" + id);
                        }}>
                            Go Back
                        </Button>
                        <h2>{name + " - my questions:"}</h2>
                        <Row>
                            <Col xs={6}>
                                <div>
                                    <label htmlFor="search">Search:</label>
                                    <input type="text" id="search" onChange={handleSearchChange} value={searchTerm} />
                                </div>
                            </Col>
                            <Col xs={6} className="text-right">
                                <div>
                                    <label htmlFor="orderBy">Order by:</label>
                                    <select id="orderBy" onChange={handleOrderByChange} value={orderBy}>
                                        <option value="title">Title</option>
                                        <option value="description">Description</option>
                                    </select>
                                    
                                    
                                    <button onClick={handleOrderDirectionChange}>
                                        {orderDirection === 'asc' ? 'Ascending' : 'Descending'}
                                    </button>
                                </div>
                            </Col>
                        </Row>
                        {
                            filteredAndSortedQuestions.map((question) =>
                                <QuestionCard key={question.id} question={question} />
                            )
                        }
                    </Col>
                </Row>
            </Container>
        </>
    );
}

function QuestionCard(props) {

    return (
        <Card>
            <Card.Body>
                <Card.Title>{props.question.title}</Card.Title>
                <Card.Text>{props.question.description}</Card.Text>
                <Link to={`/questions/${props.question.id}`}>
                    <Button variant="primary">Details</Button>
                </Link>
            </Card.Body>
        </Card>
    );
}

function QuestionForm(props) {

    const { id } = useParams();
    const projects = props.projects;

    let name = "";

    for (let project of projects) {
        if (project.id == id) {
            name = project.name;
        }
    }

    const [title, setTitle] = useState('');
    const [description, setDescription] = useState('');
    const [questionid, setQuestionid] = useState(0);
    const [loading, setLoading] = useState(true);

    const addQuestion = (e) => {
        API.addQuestion(e)
            .then((qid) => {
                props.setQDirty(true);
                setQuestionid(qid);
            })
            .catch((err) => handleErrors(err));
    }

    useEffect(() => {
        const AIloading = async () => {
            await new Promise((resolve) => setTimeout(resolve, 2000));
            setLoading(false);
        }
        if (questionid != 0) {
            AIloading();
        }
    }, [questionid]);

    const navigate = useNavigate();

    const [showConfirmation, setShowConfirmation] = useState(false);

    const handleGoBack = () => {
        if (title || description) {
            setShowConfirmation(true);
        } else {
            navigate("/projects/" + id);
        }
    };

    const handleCloseConfirmation = () => {
        setShowConfirmation(false);
    };

    const handleConfirmGoBack = () => {
        navigate("/projects/" + id);
        handleCloseConfirmation();
    };

    return (
        <>
            {questionid == 0 ?
                <>
                    <NavHeader user={props.user} />

                    <Container fluid>
                        <Row>
                            <Col md={3} className="bg-light sidebar">
                                <Nav defaultActiveKey="/" className="flex-column">
                                    <Nav.Link as={Link} to="/">My Projects</Nav.Link>
                                    <Nav.Link as={Link} to={"/projects/" + id}>{name}</Nav.Link>
                                    <Nav.Link eventKey="disabled" disabled>Make a question</Nav.Link>
                                </Nav>
                            </Col>
                            <Col md={9} className="ml-sm-auto">
                                <Button variant="secondary" onClick={handleGoBack}>
                                    Go Back
                                </Button>
                                <h2>{name}</h2>
                                <h2>Your question:</h2>
                                <Form>
                                    <Form.Group controlId="formTitle">
                                        <Form.Label>Title</Form.Label>
                                        <Form.Control
                                            type="text"
                                            placeholder="Enter title"
                                            value={title}
                                            onChange={(e) => setTitle(e.target.value)}
                                        />
                                    </Form.Group>
                                    <Form.Group controlId="formDescription">
                                        <Form.Label>Description</Form.Label>
                                        <Form.Control
                                            as="textarea"
                                            rows={3}
                                            placeholder="Enter description"
                                            value={description}
                                            onChange={(e) => setDescription(e.target.value)}
                                        />
                                    </Form.Group>
                                </Form>

                                <Modal show={showConfirmation} onHide={handleCloseConfirmation}>
                                    <Modal.Header closeButton>
                                        <Modal.Title>Confirm Go Back</Modal.Title>
                                    </Modal.Header>
                                    <Modal.Body>
                                        Are you sure you want to go back? Your changes will be lost.
                                    </Modal.Body>
                                    <Modal.Footer>
                                        <Button variant="secondary" onClick={handleCloseConfirmation}>
                                            Cancel
                                        </Button>
                                        <Button variant="primary" onClick={handleConfirmGoBack}>
                                            Confirm
                                        </Button>
                                    </Modal.Footer>
                                </Modal>

                                <Button variant="primary" onClick={() => {
                                    const question = {
                                        "title": title,
                                        "description": description,
                                        "projectid": Number(id)
                                    }
                                    addQuestion(question);
                                }}>Submit to AI</Button>
                            </Col>
                        </Row>
                    </Container>
                </>
                :
                <>
                    {loading ?
                        <h2>Waiting for AI response...</h2>
                        :
                        <Navigate replace to={"/questions/" + questionid} />
                    }
                </>
            }</>
    );
}

function SolutionCard(props) {

    return (
        <Card>
            <Card.Body>
                <Card.Title>{"Solution by user #" + props.solution.userid}</Card.Title>
                <Card.Text>{props.solution.text}</Card.Text>
                <Link to={`/solutions/${props.solution.id}`}>
                    <Button variant="primary">Details</Button>
                </Link>
            </Card.Body>
        </Card>
    );
}

function AISolutionCard(props) {

    return (
        <Card>
            <Card.Body>
                <Card.Title>{"Solution by user #" + props.solution.userid}</Card.Title>
                <Card.Text>{props.solution.text}</Card.Text>
            </Card.Body>
        </Card>
    );
}

function QuestionPage(props) {

    const { qid } = useParams();

    const navigate = useNavigate();

    const questions = props.questions;
    const projects = props.projects;
    const solutions = props.solutions;

    let aisolutions = [];
    let usersolutions = [];

    let question = {
        title: "",
        description: "",
        projectid: 0,
        userid: 0
    };

    for (let q of questions) {
        if (q.id == qid) {
            question.title = q.title;
            question.description = q.description;
            question.projectid = q.projectid;
            question.userid = q.userid;
        }
    }

    let projectname = "";

    for (let p of projects) {
        if (p.id == question.projectid) {
            projectname = p.name;
        }
    }

    for (let s of solutions) {
        if (s.questionid == qid && s.userid != question.userid) {
            usersolutions.push(s);
        }
        if (s.questionid != qid && s.userid != question.userid && aisolutions.length < 3) {
            aisolutions.push(s);
        }
    }

    return (
        <>
            <NavHeader user={props.user} />

            <Container fluid>
                <Row>
                    <Col md={3} className="bg-light sidebar">
                        <Nav defaultActiveKey="/" className="flex-column">
                            <Nav.Link as={Link} to="/">My Projects</Nav.Link>
                            <Nav.Link as={Link} to={"/projects/" + question.projectid}>{projectname}</Nav.Link>
                            {
                                question.userid == props.user.id ?
                                    <Nav.Link as={Link} to={"/projects/" + question.projectid + "/myquestions"}>My questions</Nav.Link>
                                    :
                                    <Nav.Link as={Link} to={"/projects/" + question.projectid + "/questions"}>Questions</Nav.Link>
                            }
                            <Nav.Link eventKey="disabled" disabled>{question.title}</Nav.Link>
                        </Nav>
                    </Col>
                    <Col md={9} className="ml-sm-auto">
                        {
                            question.userid == props.user.id ?
                                <Button variant="secondary" onClick={() => {
                                    navigate("/projects/" + question.projectid + "/myquestions");
                                }}>
                                    Go Back
                                </Button>
                                :
                                <Button variant="secondary" onClick={() => {
                                    navigate("/projects/" + question.projectid + "/questions");
                                }}>
                                    Go Back
                                </Button>
                        }
                        <h2>{question.title}</h2>
                        <p>{question.description}</p>
                        <h4>{"The AI has found " + aisolutions.length + " possible solutions:"}</h4>
                        {
                            aisolutions.map((solution) =>
                                <AISolutionCard key={solution.id} solution={solution} />
                            )
                        }
                        <h4>{"There are " + usersolutions.length + " possible solutions from other users:"}</h4>
                        {
                            usersolutions.map((solution) =>
                                <SolutionCard key={solution.id} solution={solution} />
                            )
                        }
                        {
                            question.userid == props.user.id ?
                                <></>
                                :
                                <Button variant="primary">Propose solution</Button>
                        }
                    </Col>
                </Row>
            </Container>
        </>
    );
}

function SolutionPage(props) {

    const { sid } = useParams();

    const navigate = useNavigate();

    const solutions = props.solutions;
    const questions = props.questions;
    const projects = props.projects;

    let projectid = 0;
    let projectname = "";
    let questiontitle = "";
    let questionuserid = 0;

    let solution = {
        text: "",
        questionid: 0,
        userid: 0
    };

    for (let s of solutions) {
        if (s.id == sid) {
            solution.text = s.text;
            solution.questionid = s.questionid;
            solution.userid = s.userid;
        }
    }

    for (let q of questions) {
        if (q.id == solution.questionid) {
            questiontitle = q.title;
            projectid = q.projectid;
            questionuserid = q.userid;
        }
    }

    for (let p of projects) {
        if (p.id == projectid) {
            projectname = p.name;
        }
    }

    return (
        <>
            <NavHeader user={props.user} />

            <Container fluid>
                <Row>
                    <Col md={3} className="bg-light sidebar">
                        <Nav defaultActiveKey="/" className="flex-column">
                            <Nav.Link as={Link} to="/">My Projects</Nav.Link>
                            <Nav.Link as={Link} to={"/projects/" + projectid}>{projectname}</Nav.Link>
                            {
                                questionuserid == props.user.id ?
                                    <Nav.Link as={Link} to={"/projects/" + projectid + "/myquestions"}>My questions</Nav.Link>
                                    :
                                    <Nav.Link as={Link} to={"/projects/" + projectid + "/questions"}>Questions</Nav.Link>
                            }
                            <Nav.Link as={Link} to={"/questions/" + solution.questionid}>{questiontitle}</Nav.Link>
                            <Nav.Link eventKey="disabled" disabled>{"Solution by user #" + solution.userid}</Nav.Link>
                        </Nav>
                    </Col>
                    <Col md={9} className="ml-sm-auto">
                        <Button variant="secondary" onClick={() => {
                            navigate("/questions/" + solution.questionid);
                        }}>
                            Go Back
                        </Button>
                        <h2>{"Solution by user #" + solution.userid}</h2>
                        <p>{solution.text}</p>
                    </Col>
                </Row>
            </Container>
        </>
    );
}

function LoginLayout(props) {
    return (
        <Row>
            <Col md={12}>
                <LoginForm login={props.login} />
            </Col>
        </Row>
    );
}

export { MainLayout, ProjectDetailsLayout, QuestionForm, QuestionPage, QuestionsLayout, MyQuestionsLayout, SolutionPage, LoginLayout };
