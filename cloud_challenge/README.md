***AWS Cloud Site Architecture Diagram***

![aws_cloud_site_architecture_diagram](https://github.com/kingdevtk/terraform-projects/assets/61067769/1a5fd0b1-6016-45be-8ae5-e505a94d3d1b)



1) **GitHub Repository**: Contains front-end and backend code

2) **GitHub Actions**: Automates the deployment of front end and backend code, and also performs tests.

3) **Terraform**: Automates the deployment of the required AWS resources that power the site (S3, Cloudfront, Route53, APIGW, Lambda, DynamoDB). 

4) **Amazon S3** (Simple Storage Service): Stores and serves the static site files (HTML, CSS, and JavaScript), providing high availability, security, performance, and scalability.

5) **CloudFront**: Content delivery network (CDN) that improves the performance of the site by caching content in edge locations around the world. Distributiing site files globally reduces latency and improves the overall user experience.

6) **Route53**: DNS web service.

7) **AWS Certificate Manager**: Provides an SSL/TLS certificate for securing the site with HTTPS, encrypting the communication between the site and its visitors.


***Visitor Counter (DEPRECATED)***: This feature was deprecated in favor of a copyright footer. 

8) **API Gateway**: Exposes the Lambda function as an HTTP endpoint, enabling communication between the site and Lambda function.

9) **Lambda**: A Lambda function is used to execute the Python code that retrieves and stores the site visitor count.

10) DynamoDB: Stores and manages the visitor count data retrieved by the Lambda function, providing fast and scalable performance for read and write operations.
