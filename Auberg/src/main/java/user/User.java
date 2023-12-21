package user;

public class User {
    private String username;
    private String password;
    private String email;
    private String address;
    private String phoneNumber;
    private String parentDetails;
    private int age;
    private String gender;
    private String aadharNumber;
    private String collegeName;
    private String collegeAddress;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // Additional constructor for user registration
    public User(String username, String password, String email, String address, String phoneNumber,
                String parentDetails, int age, String gender, String aadharNumber,
                String collegeName, String collegeAddress) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.parentDetails = parentDetails;
        this.age = age;
        this.gender = gender;
        this.aadharNumber = aadharNumber;
        this.collegeName = collegeName;
        this.collegeAddress = collegeAddress;
    }

    // Getters for all fields

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getParentDetails() {
        return parentDetails;
    }

    public int getAge() {
        return age;
    }

    public String getGender() {
        return gender;
    }

    public String getAadharNumber() {
        return aadharNumber;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public String getCollegeAddress() {
        return collegeAddress;
    }

    // Additional setters if needed
    private String role;

    // Constructors, getters, setters, etc.

    public String getRole() {
        return role;
    }

    public boolean isAdmin() {
        return "admin".equals(role);
    }
}

