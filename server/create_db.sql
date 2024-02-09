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
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Use feature detection techniques and polyfills to provide fallbacks for unsupported features in older browsers.", 3, 1, 3, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement responsive design principles to adapt the layout and content based on the user's device screen size.", 5, 1, 2, 5, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Minify and concatenate CSS and JavaScript files to reduce file size and decrease load times.", 2, 2, 4, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Optimize images by compressing them without sacrificing quality and lazy loading techniques to defer the loading of non-essential images.", 3, 2, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize browser caching and content delivery networks (CDNs) to cache static assets and deliver content more efficiently.", 4, 2, 6, 5, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement server-side caching and database query optimization to reduce server response times and improve overall website performance.", 4, 2, 1, 5, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Ensure proper semantic markup using HTML5 elements to enhance accessibility and improve screen reader compatibility.", 1, 3, 0, 7, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Provide alternative text for images and use ARIA roles and attributes to enhance accessibility for users with disabilities.", 3, 3, 2, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Conduct accessibility audits using tools like Axe or WAVE to identify accessibility issues and address them accordingly.", 1, 3, 0, 7, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement keyboard navigation and focus management techniques to ensure that all interactive elements are accessible via keyboard navigation.", 3, 3, 2, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement input validation and parameterized queries to prevent SQL injection attacks.", 1, 4, 0, 7, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Use HTTPS protocol and secure cookie attributes to encrypt data transmitted over the network and prevent man-in-the-middle attacks.", 2, 4, 2, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Apply Content Security Policy (CSP) headers to mitigate cross-site scripting (XSS) attacks by restricting the sources of executable scripts.", 1, 4, 0, 7, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Regularly update libraries, frameworks, and dependencies to patch known security vulnerabilities and stay protected against emerging threats.", 5, 4, 2, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement workflow automation tools within the content management system to streamline the content creation and publishing process. This includes automated approval workflows, scheduled content publishing, and notifications for content review and updates.", 1, 5, 4, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Provide a library of customizable templates within the content management system to expedite the creation of new pages and content types. These templates should offer flexibility in layout, design, and functionality, allowing content creators to maintain brand consistency while tailoring content to specific needs.", 2, 5, 1, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Design the architecture using a microservices approach to decouple components and scale them independently based on demand.", 3, 5, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement horizontal scaling by adding more servers or instances to distribute the workload and handle increased traffic.", 1, 5, 5, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize cloud-based services like AWS Auto Scaling or Google Kubernetes Engine to automatically adjust resources based on traffic patterns.", 5, 5, 9, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Monitor performance metrics such as CPU usage and response times to proactively identify scalability bottlenecks and optimize resource allocation.", 2, 5, 8, 4, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Design the architecture using a microservices approach to decouple components and scale them independently based on demand.", 3, 6, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement horizontal scaling by adding more servers or instances to distribute the workload and handle increased traffic.", 1, 6, 5, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize cloud-based services like AWS Auto Scaling or Google Kubernetes Engine to automatically adjust resources based on traffic patterns.", 4, 6, 9, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Monitor performance metrics such as CPU usage and response times to proactively identify scalability bottlenecks and optimize resource allocation.", 3, 6, 8, 4, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement tokenization to securely store payment information and reduce PCI compliance scope.", 3, 7, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize hosted payment gateways like PayPal or Stripe to handle payment processing and security compliance.", 1, 7, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Perform thorough testing with sandbox environments to ensure seamless integration and transaction processing.", 4, 7, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement webhook notifications to receive real-time updates on payment statuses and handle post-payment actions.", 2, 7, 9, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize barcode scanning technology and RFID tags for efficient tracking and management of inventory items.", 4, 8, 6, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement automated reorder triggers based on inventory levels and historical sales data to prevent stockouts.", 1, 8, 8, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Integrate with suppliers' systems using EDI or API to streamline procurement processes and update inventory in real-time.", 4, 8, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize inventory forecasting algorithms and demand planning tools to optimize inventory levels and reduce carrying costs.", 2, 8, 9, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement multi-factor authentication (MFA) to add an extra layer of security by requiring users to verify their identity using multiple methods.", 3, 9, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize OAuth or OpenID Connect for single sign-on (SSO) to enable users to log in using their existing credentials from trusted identity providers.", 1, 9, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement passwordless authentication methods such as email or SMS-based authentication to eliminate the need for passwords and improve user experience.", 5, 9, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize biometric authentication methods such as fingerprint or facial recognition for secure and convenient user authentication on supported devices.", 2, 9, 9, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement encryption mechanisms to protect sensitive data both at rest and in transit, ensuring compliance with data privacy regulations such as GDPR or HIPAA.", 3, 10, 7, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Regularly conduct privacy impact assessments (PIAs) to identify and mitigate potential privacy risks associated with data processing activities.", 2, 10, 5, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement data anonymization techniques to remove personally identifiable information (PII) from datasets while retaining their utility for analysis and research purposes.", 4, 10, 8, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Ensure compliance with data retention and deletion policies by implementing automated data lifecycle management processes and controls.", 2, 10, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Fine-tune anomaly detection algorithms by adjusting thresholds and incorporating feedback from security analysts to reduce false positives.", 3, 11, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement machine learning techniques such as supervised learning to train the system to distinguish between benign and malicious activities more accurately.", 1, 11, 5, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Integrate threat intelligence feeds and blacklists to filter out known malicious IP addresses and signatures and reduce false positives.", 4, 11, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize sandboxing and behavior analysis techniques to analyze suspicious activities in isolated environments and verify their maliciousness before triggering alerts.", 2, 11, 9, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement distributed monitoring using agent-based or agentless monitoring tools to collect data from multiple sources in real-time.", 3, 12, 8, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize stream processing frameworks like Apache Kafka or Apache Flink to process and analyze large volumes of data in real-time.", 1, 12, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Use anomaly detection algorithms and statistical techniques to identify abnormal patterns and potential security threats in real-time.", 4, 12, 7, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement automated alerting and notification systems to promptly alert administrators of any unusual activities or performance degradation.", 2, 12, 9, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize centralized patch management systems to deploy patches and updates across all devices and systems in the network.", 3, 13, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement automated vulnerability scanning tools to identify missing patches and prioritize patching based on severity levels.", 1, 13, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Establish patch testing procedures in a controlled environment to ensure that patches do not introduce new issues or compatibility problems.", 4, 13, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Maintain an up-to-date inventory of software and hardware assets to track patch status and identify vulnerable systems.", 3, 13, 9, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Develop interactive training modules and simulations to educate users on security best practices and how to recognize common threats.", 3, 14, 7, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Conduct regular security awareness sessions and provide ongoing reminders through email newsletters or posters to reinforce key concepts and behaviors.", 1, 14, 5, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize phishing simulation exercises to test users' susceptibility to phishing attacks and provide targeted training based on the results.", 5, 14, 8, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Reward and recognize employees who demonstrate good security practices and report security incidents or suspicious activities.", 2, 14, 6, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement automated compliance monitoring tools to continuously assess adherence to regulatory requirements and generate compliance reports.", 3, 15, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize standardized reporting templates and workflows to streamline the preparation and submission of compliance reports.", 1, 15, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Maintain audit trails and documentation of security controls and measures implemented to demonstrate compliance during audits and inspections.", 3, 15, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Engage external auditors or consultants to conduct independent assessments and validate compliance efforts on a periodic basis.", 2, 15, 9, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Design the system architecture with modular components and APIs to allow for easy customization and integration of third-party extensions.", 3, 16, 7, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Provide a comprehensive set of configuration options and settings to allow users to customize various aspects of the system to meet their specific needs.", 1, 16, 5, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement a plugin or extension framework that enables developers to create and deploy custom functionality without modifying the core system.", 4, 16, 8, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Offer software development kits (SDKs) and documentation to empower developers to build custom integrations and extensions with ease.", 1, 16, 6, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize a version control system such as Git or SVN to track changes to source code and collaborate on software development projects.", 5, 17, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Establish branching and merging strategies to manage concurrent development efforts and facilitate code reviews and releases.", 1, 17, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement automated build and deployment pipelines to ensure consistent and reliable software releases across different environments.", 4, 17, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Enforce code review practices and quality gates to maintain code quality and prevent regressions in the software development lifecycle.", 2, 17, 9, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement full-text search engines like Elasticsearch or Apache Solr to enable fast and accurate searching of textual data within the system.", 4, 18, 7, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize advanced search algorithms and indexing techniques to support complex search queries and filtering options for users.", 1, 18, 5, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Integrate with external search providers or APIs to leverage their search capabilities and provide enhanced search functionality to users.", 4, 18, 8, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Optimize search performance through query optimization, caching mechanisms, and distributed search indices to handle large volumes of data efficiently.", 2, 18, 6, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement internationalization (i18n) and localization (l10n) features to support multiple languages and cultural conventions within the system.", 3, 19, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Provide customizable language packs and translation tools to allow users or administrators to translate the user interface and content into different languages.", 4, 19, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize language detection algorithms and user preferences to automatically display content in the user's preferred language whenever possible.", 4, 19, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Ensure proper encoding and Unicode support throughout the system to handle multilingual data and prevent character encoding issues.", 2, 19, 9, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement regular backups of critical data and system configurations to secure storage locations, both onsite and offsite, to protect against data loss.", 3, 20, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize incremental and differential backup strategies to minimize backup time and storage space while ensuring comprehensive data protection.", 1, 20, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Perform periodic disaster recovery drills and tests to validate backup integrity and verify the effectiveness of recovery procedures.", 4, 20, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement automated backup and recovery processes with scheduling and monitoring capabilities to ensure timely backups and minimize downtime.", 3, 20, 9, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Develop cross-platform applications using frameworks like React Native or Flutter to target multiple platforms with a single codebase.", 3, 21, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize responsive design principles and adaptive layouts to ensure consistent user experiences across different devices and screen sizes.", 1, 21, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Maintain compatibility with older versions of operating systems and browsers to accommodate users on legacy platforms and devices.", 4, 21, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Regularly update and optimize platform-specific code and configurations to address fragmentation challenges and improve performance and compatibility.", 5, 21, 9, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement local caching mechanisms and offline storage solutions like IndexedDB or SQLite to store data locally and enable offline access to content.", 4, 22, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize service workers and progressive web app (PWA) technologies to provide offline functionality and seamless experiences for users with limited or no internet connectivity.", 1, 22, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement synchronization mechanisms to reconcile changes made offline with the server-side data once the device is back online, ensuring data consistency.", 4, 22, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Offer configurable offline modes and settings to allow users to control offline behavior and optimize data usage based on their preferences and requirements.", 2, 22, 9, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize push notification services like Firebase Cloud Messaging or Apple Push Notification Service to send real-time notifications to users on mobile and web platforms.", 2, 23, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement user segmentation and targeting strategies to deliver personalized and relevant push notifications based on user preferences and behaviors.", 1, 23, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Monitor push notification performance metrics such as delivery rates and engagement metrics to optimize messaging strategies and improve user engagement.", 4, 23, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement opt-in/opt-out mechanisms and granular notification settings to allow users to control the frequency and types of push notifications they receive.", 2, 23, 9, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Review and adhere to the app store guidelines and policies provided by platforms such as Apple App Store and Google Play Store to ensure compliance.", 3, 24, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Conduct thorough testing and quality assurance checks to verify that the app meets the technical and content requirements specified by the app store guidelines.", 4, 24, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Engage legal experts or consultants to review the app store guidelines and provide guidance on compliance requirements and potential legal implications.", 4, 24, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Monitor app store updates and announcements to stay informed about changes to guidelines and policies and ensure ongoing compliance with evolving requirements.", 2, 24, 9, 0, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Implement feedback collection mechanisms such as in-app surveys, feedback forms, or rating prompts to gather user feedback directly within the application.", 3, 25, 8, 2, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Integrate with third-party feedback management platforms or services to aggregate and analyze user feedback from multiple channels and sources.", 1, 25, 6, 1, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Utilize sentiment analysis and natural language processing (NLP) techniques to analyze user feedback and extract actionable insights and trends.", 4, 25, 7, 3, 0);
INSERT INTO "solutions" (text, userid, questionid, nlikes, ndislikes, liked) VALUES ("Establish a transparent feedback loop with users by acknowledging and responding to their feedback promptly and transparently, fostering a culture of trust and collaboration.", 3, 25, 9, 0, 0);


INSERT INTO "users" (name, email, hash, salt) VALUES ("Mario Rossi", "mario.rossi@polito.it", "5e5f3e89da657f0553dd61d75cbbed3d67edcd8448c4720aa9d4d7af35c7530068b9848ffcf8d563819fb7684f170052f6d56d47710a9f4a63fdda1bfabaf406", "3me9dkwma110smdp");
INSERT INTO "users" (name, email, hash, salt) VALUES ("Paolo Bianchi", "paolo.bianchi@polito.it", "5e5f3e89da657f0553dd61d75cbbed3d67edcd8448c4720aa9d4d7af35c7530068b9848ffcf8d563819fb7684f170052f6d56d47710a9f4a63fdda1bfabaf406", "3me9dkwma110smdp");
INSERT INTO "users" (name, email, hash, salt) VALUES ("Luca Verdi", "luca.verdi@polito.it", "5e5f3e89da657f0553dd61d75cbbed3d67edcd8448c4720aa9d4d7af35c7530068b9848ffcf8d563819fb7684f170052f6d56d47710a9f4a63fdda1bfabaf406", "3me9dkwma110smdp");
INSERT INTO "users" (name, email, hash, salt) VALUES ("Alessio Gialli", "alessio.gialli@polito.it", "5e5f3e89da657f0553dd61d75cbbed3d67edcd8448c4720aa9d4d7af35c7530068b9848ffcf8d563819fb7684f170052f6d56d47710a9f4a63fdda1bfabaf406", "3me9dkwma110smdp");
INSERT INTO "users" (name, email, hash, salt) VALUES ("Alice Viola", "alice.viola@polito.it", "5e5f3e89da657f0553dd61d75cbbed3d67edcd8448c4720aa9d4d7af35c7530068b9848ffcf8d563819fb7684f170052f6d56d47710a9f4a63fdda1bfabaf406", "3me9dkwma110smdp");

COMMIT;

-- sqlite3 projects.db
-- .databases
-- .quit
