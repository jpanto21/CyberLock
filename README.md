# CyberLock

CyberLock is a user-centric web application dedicated to strengthening your online security. It simplifies the management of digital credentials, such as usernames and emails tied to various organizations, while also leveraging the Have I Been Pwned API to swiftly detect potential data breaches. Furthermore, CyberLock introduces Custos, an OpenAI-powered Cyber Security Expert, offering personalized guidance and insights on cyber security matters. With its intuitive interface and advanced functionalities, CyberLock empowers users to safeguard their digital identities effectively.


## Table of Contents
- [Main Features](#main-features)
- [Technologies Used](#technologies-used)
- [Services Used](#services-used)
- [Installation](#installation)
- [Contribution Guidelines](#contribution-guidelines)
- [FAQ](#faq)

## Main Features
### Credentials Storage
In CyberLock, users can securely store a range of credentials, including emails, usernames, and their associated organizations or companies where these credentials are utilized. This feature provides users with a convenient and organized way to manage their digital identity and access important information whenever needed.

### Email Checker
Users can input their email addresses into form, where they'll receive information regarding any potential data breaches. If their email hasn't been compromised, CyberLock will provide reassurance. However, if there's been a breach, users will receive comprehensive information, including the breach's timing, affected domain name, types of records stolen, and more. This feature serves as a proactive safeguard, keeping users informed and their digital identities secure.



### Custos with Open AI API
Through the OpenAI API, Custos generates detailed and informative responses to users' questions, providing valuable insights into various cybersecurity topics. These responses delivered and are also stored for users to review at their convenience. With Custos, users can explore the nuances of cybersecurity confidently.

## Technologies Used
* Rails 7
* BootStrap


## Services Used
* Have I been pwned API 
* OpenAI API

### Configuration

To configure your application to use Have I been pwned and OpenAI API services, follow these detailed steps:

#### 1. Generate a Master Key
If you do not already have a `master.key` file, you can generate one by running:
```bash
EDITOR="code --wait" rails credentials:edit
```

This command will open the credentials file in Visual Studio Code (replace "code --wait" with your preferred editor), and a new master.key file will be generated automatically if it does not exist.

#### 2. Add Service API Tokens
Inside the opened credentials file, add your API tokens and other sensitive configuration variables in a structured format. For example:

```yaml

openai:
  api_key: YOUR_OPENAI_API_KEY
```

Save and close the file. The changes will be encrypted and saved securely, accessible only via the master.key.

HIBP key was stored in Enviroment in order to learn both ways to access API KEY, store HIBP KEY in your enviroment under HIBP_KEY:
```
HIBP_KEY: YOUR_HIBP_API_KEY
```
#### 3. Ensure the Security of the Master Key
Never commit your master.key or the credentials file to version control. Add the master.key to your .gitignore file to prevent it from being accidentally pushed to your repository:
```bash
echo 'config/master.key' >> .gitignore
```
## Installation

### Current Main Branch: rails 7 + esbuild
* clone the repository and switch to the main branch
* run the following commands

```sh
bundle install
rails db:migrate
rake sample_data
bin/dev
```
After running the above commands user will have emails generate wiht username names and associated companies

### Entity Relationship Diagram
![Domain_model_cyberLock](https://github.com/jpanto21/CyberLock/assets/77706927/c3c6d45f-c54e-4d53-b344-446339b7a3bf)


## Contribution Guidelines

### Introduction
Thank you for your interest in contributing to **CyberLock**. This document provides guidelines and instructions on how to contribute to the project.

### How to Contribute
1. **Setup your environment**: Follow the installation instructions above.
2. **Find an issue to work on**: In the Projects tab, check out our issues, at times I may have some issues labeled "good first issue".

### Coding Conventions
We adhere to the Ruby community style guide, and we expect all contributors to follow suit. Here are key conventions specific to our project:

- **Code Style**: Follow the [Ruby Style Guide](https://rubystyle.guide/), which provides detailed guidelines on the coding style preferred by the Ruby community.
- **Naming Conventions**:
  - Use `snake_case` for variables, methods, and file names.
  - Use `PascalCase` for class and module names.
  - Reflect domain concepts accurately in naming. For instance, if you are working within a medical application, prefer names like `patient_record` over vague terms like `data_entry`.

- **Design Principles**: Focus on Domain-Driven Design (DDD):
  - Organize code to reflect the domain model clearly.
  - Use service objects, decorators, and other design patterns that help isolate domain logic from application logic.



### Comments and Documentation
- **Document methods and classes** thoroughly, focusing on their roles within the domain model, especially for public APIs.

### Version Control Practices
- Commit messages should be clear and follow best practices, such as those outlined in [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/).
- Keep commits focused on a single issue to simplify future maintenance and troubleshooting.

### Branch Naming Conventions
Please use the following naming conventions for your branches:

- `<issue#-description>` (i.e 15-added-api-key)

### Pull Request Process
1. **Creating a Pull Request**: Provide a detailed PR description, referencing the issue it addresses.
2. **Review Process**: PRs require review from at least one maintainer.

### Community and Communication
Join our [Discord] to communicate with other contributors and maintainers.

### Acknowledgment of Contributors
Contributors who make significant contributions will be listed in our [README/CONTRIBUTORS] file.

Your contrubutions to  **CyberLock** are appreciated. 


## FAQ

### Open AI API Setup
* For setup help, see the [Have I been Pwned  Documentation](https://haveibeenpwned.com/API/v3)

### Master Key Errors
* Be sure to follow the [Configuration Instructions](#configuration) if you encounter an issue when setting up the project.

### Open AI API Setup
* For setup help, see the [Open AI Documentation](https://platform.openai.com/docs/introduction)

### Ruby Version Errors
* The project is written using Ruby 3.1.1, if you encounter issues upon cloning, make sure you have Ruby version 3.1.1 in your environment.

<hr>

# Code Review

## Documentation
- Excellent README!

## Version Control
- Excellent use of issue tracking 
- Excellent use of project board

## Frontend
- No notes! Great job

## Backend
- Consider adding Pundit or other authorization framework
- Great job adding ChatGPT; very ambitious
