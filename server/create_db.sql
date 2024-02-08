BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS "projects" (
	"id"	        INTEGER PRIMARY KEY AUTOINCREMENT,
	"name"	        TEXT,
	"description"	TEXT
);

CREATE TABLE IF NOT EXISTS "questions" (
	"id"	        INTEGER PRIMARY KEY AUTOINCREMENT,
	"title"	        TEXT,
	"description"	TEXT,
	"userid"		INTEGER,
	"projectid"		INTEGER
);

CREATE TABLE IF NOT EXISTS "solutions" (
	"id"	        INTEGER PRIMARY KEY AUTOINCREMENT,
	"text"	        TEXT,
	"userid"		INTEGER,
	"questionid"	INTEGER,
	"nlikes"		INTEGER,
	"ndislikes"		INTEGER,
	-- liked -> 0 not liked or disliked, 1 liked, 2 disliked
	"liked"			INTEGER
);

CREATE TABLE IF NOT EXISTS "users" (
	"id"	    INTEGER PRIMARY KEY AUTOINCREMENT,
	"name"	    TEXT,
	"email"		TEXT,
	"hash"		TEXT,
	"salt"		TEXT
);

INSERT INTO "projects" (name, description) VALUES ("PhoenixWeb", "PhoenixWeb is a cutting-edge web development project aimed at creating responsive and visually stunning websites for clients across various industries. Using the latest technologies such as HTML5, CSS3, and JavaScript frameworks like React, we ensure that each website is not only aesthetically pleasing but also highly functional and user-friendly.");
INSERT INTO "projects" (name, description) VALUES ("QuantumCommerce", "QuantumCommerce is an ambitious e-commerce platform designed to revolutionize online shopping experiences. Leveraging advanced algorithms and machine learning, we provide personalized product recommendations, seamless checkout processes, and secure payment gateways. Our goal is to empower businesses to thrive in the digital marketplace.");
INSERT INTO "projects" (name, description) VALUES ("SentinelApp", "SentinelApp is a robust cybersecurity application built to safeguard sensitive data and protect against cyber threats. With features such as real-time threat detection, malware scanning, and encryption protocols, SentinelApp offers comprehensive security solutions for businesses of all sizes. Rest assured, your digital assets are in safe hands with SentinelApp.");
INSERT INTO "projects" (name, description) VALUES ("InfinityCMS", "InfinityCMS is a versatile content management system tailored for content creators, bloggers, and businesses seeking an intuitive platform to manage their online presence. With customizable templates, drag-and-drop functionality, and SEO optimization tools, InfinityCMS empowers users to create and publish engaging content effortlessly.");
INSERT INTO "projects" (name, description) VALUES ("NebulaMobile", "NebulaMobile is a mobile application development project focused on delivering innovative solutions for iOS and Android devices. From social networking apps to productivity tools, NebulaMobile harnesses the power of mobile technology to enhance everyday experiences. Our team of developers is dedicated to bringing your ideas to life in the palm of your hand.");

INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Cross-browser Compatibility", "How can we ensure that the website displays correctly across different web browsers and devices?", 1, 1);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Performance Optimization", "What strategies can we implement to improve the loading speed and overall performance of the website?", 1, 1);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Accessibility Compliance", "What measures should be taken to ensure the website is accessible to users with disabilities, in accordance with WCAG guidelines?", 2, 1);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Security Measures", "How can we strengthen the website's security to prevent vulnerabilities such as SQL injection and cross-site scripting attacks?", 3, 1);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Content Management", "What tools or frameworks can be integrated to facilitate content management and updates for the website administrators?", 4, 1);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Scalability Planning", "How can we design the e-commerce platform to accommodate increasing traffic and transaction volumes as the business grows?", 2, 2);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Payment Gateway Integration", "What challenges might arise during the integration of multiple payment gateways, and how can they be addressed?", 5, 2);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Inventory Management", "What strategies should be employed to efficiently manage product inventory and prevent overselling or stockouts?", 3, 2);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("User Authentication", "How can we ensure secure user authentication and prevent unauthorized access to customer accounts?", 4, 2);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Data Privacy Compliance", "What steps are necessary to ensure compliance with data privacy regulations such as GDPR and CCPA when handling customer information?", 1, 2);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("False Positive Reduction", "What methods can be utilized to minimize false positives in the detection of security threats and anomalies?", 5, 3);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Real-time Monitoring Challenges", "What are the potential challenges in implementing real-time monitoring of network traffic and system activities?", 5, 3);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Patch Management", "How can we effectively manage and deploy security patches to mitigate vulnerabilities in the system?", 2, 3);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("User Training and Awareness", "What strategies should be employed to educate users about cybersecurity best practices and mitigate human error?", 4, 3);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Compliance Reporting", "How can we streamline the process of generating compliance reports to meet regulatory requirements and auditing standards?", 4, 3);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Customization Flexibility", "How can we provide users with sufficient flexibility to customize website templates while maintaining consistency and ease of use?", 2, 4);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Version Control", "What version control system should be implemented to manage changes to website content and prevent conflicts among multiple contributors?", 3, 4);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Search Functionality", "What techniques can be employed to enhance the search functionality within the CMS and improve the accuracy of search results?", 3, 4);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Multilingual Support", "How can we facilitate the creation and management of multilingual content within the CMS to cater to a diverse audience?", 1, 4);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Backup and Recovery", "What backup and recovery mechanisms should be implemented to protect against data loss and ensure the availability of website content in case of system failures?", 2, 4);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Platform Fragmentation", "How can we address the challenges posed by platform fragmentation and ensure consistent performance across different mobile devices and operating systems?", 2, 5);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Offline Functionality", "What strategies can be employed to enable offline functionality within the mobile application and synchronize data when connectivity is restored?", 3, 5);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("Push Notification Management", "How can we effectively manage push notifications to deliver timely and relevant updates to users without overwhelming them with unnecessary notifications?", 3, 5);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("App Store Guidelines Compliance", "What considerations should be taken into account to ensure compliance with the app store guidelines and policies for submission and approval?", 1, 5);
INSERT INTO "questions" (title, description, userid, projectid) VALUES ("User Feedback Integration", "How can we incorporate user feedback mechanisms within the mobile application to gather insights and continuously improve the user experience?", 2, 5);

INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize CSS frameworks like Bootstrap or Foundation to ensure consistent styling across different browsers.", 3, 1, 2, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Perform thorough testing using browser compatibility tools such as BrowserStack or CrossBrowserTesting to identify and address any rendering issues.", 2, 1, 4, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Use feature detection techniques and polyfills to provide fallbacks for unsupported features in older browsers.", 1, 1, 3, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement responsive design principles to adapt the layout and content based on the user's device screen size.", 1, 1, 2, 5, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Minify and concatenate CSS and JavaScript files to reduce file size and decrease load times.", 2, 2, 4, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Optimize images by compressing them without sacrificing quality and lazy loading techniques to defer the loading of non-essential images.", 3, 2, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize browser caching and content delivery networks (CDNs) to cache static assets and deliver content more efficiently.", 4, 2, 6, 5, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement server-side caching and database query optimization to reduce server response times and improve overall website performance.", 4, 2, 1, 5, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Ensure proper semantic markup using HTML5 elements to enhance accessibility and improve screen reader compatibility.", 1, 3, 0, 7, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Provide alternative text for images and use ARIA roles and attributes to enhance accessibility for users with disabilities.", 3, 3, 2, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Conduct accessibility audits using tools like Axe or WAVE to identify accessibility issues and address them accordingly.", 1, 3, 0, 7, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement keyboard navigation and focus management techniques to ensure that all interactive elements are accessible via keyboard navigation.", 3, 3, 2, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement input validation and parameterized queries to prevent SQL injection attacks.", 1, 4, 0, 7, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Use HTTPS protocol and secure cookie attributes to encrypt data transmitted over the network and prevent man-in-the-middle attacks.", 3, 4, 2, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Apply Content Security Policy (CSP) headers to mitigate cross-site scripting (XSS) attacks by restricting the sources of executable scripts.", 1, 4, 0, 7, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Regularly update libraries, frameworks, and dependencies to patch known security vulnerabilities and stay protected against emerging threats.", 3, 4, 2, 2, 0);

INSERT INTO "users" (name, email, hash, salt) VALUES ("Mario Rossi", "mario.rossi@polito.it", "5e5f3e89da657f0553dd61d75cbbed3d67edcd8448c4720aa9d4d7af35c7530068b9848ffcf8d563819fb7684f170052f6d56d47710a9f4a63fdda1bfabaf406", "3me9dkwma110smdp");

COMMIT;

-- sqlite3 projects.db
-- .databases
-- .quit
