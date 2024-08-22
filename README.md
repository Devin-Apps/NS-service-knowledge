# Notification Service

![CI](https://github.com/<username>/NS-service-knowledge/workflows/Continuous%20Integration/badge.svg)
![CD](https://github.com/<username>/NS-service-knowledge/workflows/Continuous%20Deployment/badge.svg)

This is a Kotlin-based DropWizard microservice for sending SMS notifications using Twilio.

## Features

- Send SMS notifications via Twilio
- Containerized with Docker
- Continuous Integration and Deployment with GitHub Actions
- Deployed on AWS ECS

## Prerequisites

- Java 11
- Maven
- Docker
- AWS CLI (for deployment)

## Local Development

1. Clone the repository:
   ```
   git clone https://github.com/<username>/NS-service-knowledge.git
   cd NS-service-knowledge
   ```

2. Set up environment variables:
   Create a `.env` file in the root directory with the following content:
   ```
   TWILIO_ACCOUNT_SID=your_account_sid
   TWILIO_AUTH_TOKEN=your_auth_token
   TWILIO_PHONE_NUMBER=your_twilio_phone_number
   ```

3. Build the project:
   ```
   mvn clean package
   ```

4. Run the service locally:
   ```
   docker-compose up --build
   ```

5. The service will be available at `http://localhost:8080`

## API Usage

To send an SMS notification, make a POST request to the `/api/v1/SMSnotifications` endpoint:

```
curl -X POST 'http://localhost:8080/api/v1/SMSnotifications' \
-H 'Content-Type: application/json' \
-d '{
  "fromNumber": "your_twilio_phone_number",
  "toNumber": "recipient_phone_number",
  "message": "Your SMS message here"
}'
```

## Deployment

The service is automatically deployed to AWS ECS when changes are pushed to the main branch. The deployment process is managed by the GitHub Actions workflow defined in `.github/workflows/cd.yml`.

## CI/CD

- Continuous Integration: GitHub Actions workflow in `.github/workflows/ci.yml`
- Continuous Deployment: GitHub Actions workflow in `.github/workflows/cd.yml`

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
