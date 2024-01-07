# SecureImageUploader

SecureImageUploader is a Java-based web application designed for enhanced data security, allowing users to upload and encrypt images while focusing on public safety scenarios such as CCTV cameras.

## Features

- **User-Friendly Interface:** Simple account creation with mandatory details (name, email) for a seamless experience.
- **Secure Image Upload:** Users can securely upload images of their choice, with automatic encryption to safeguard sensitive data.
- **Encrypted Image Sharing:** To share encrypted images, users can request a passcode, sent to their registered email address.
- **Decryption Process:** Enter the received passcode to decrypt and retrieve the original image, ensuring secure information access.

## Getting Started

Follow these steps to set up the SecureImageUploader locally:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/SecureImageUploader.git
2. **Database Setup:**
Set up a SQL database and update the connection details in src/main/resources/application.properties.
3. **Run the Application:**
Build and run the Java application.
4. **Access the Application:**
Open your web browser and navigate to http://localhost:8080.
