/**
 * 
 */
document.addEventListener("DOMContentLoaded", function () {
    const registrationForm = document.getElementById("registration-form");

    registrationForm.addEventListener("submit", function (event) {
        // Add your validation logic here
        if (!validateRegistrationForm()) {
            event.preventDefault(); // Prevent form submission if validation fails
        }
    });

    function validateRegistrationForm() {
        // Add your validation logic for each field
        const username = document.getElementById("username").value;
        const email = document.getElementById("email").value;
        const password = document.getElementById("password").value;
        // Add more fields as needed

        // Example: Check if fields are not empty
        if (!username || !email || !password) {
            alert("Please fill in all required fields.");
            return false;
        }

        // Add more validation rules as needed

        return true; // Return true if the form is valid
    }
});
