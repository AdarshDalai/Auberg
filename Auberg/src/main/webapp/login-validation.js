/**
 * 
 */
document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.getElementById("login-form");

    loginForm.addEventListener("submit", function (event) {
        // Add your validation logic here
        if (!validateLoginForm()) {
            event.preventDefault(); // Prevent form submission if validation fails
        }
    });

    function validateLoginForm() {
        // Add your validation logic for each field
        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;

        // Example: Check if fields are not empty
        if (!username || !password) {
            alert("Please enter both username and password.");
            return false;
        }

        // Add more validation rules as needed

        return true; // Return true if the form is valid
    }
});
