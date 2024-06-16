<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        /* Include your CSS here for testing */
        .register-heading {
            text-align: center;
            color: gray;
        }

        .register-popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            padding-top: 50px;
         
          
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1000;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            font-size: 15px;
        }

        .register-form {
            width: 50%; /* Increased the width of the form */
            background-color: white;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #000;
            position: relative;
        }

        .register-form input[type="text"],
        .register-form input[type="email"],
        .genderBox,
        .register-form input[type="password"] {
            padding: 16px;
            margin-top: 10px; /* Increased margin for more space between fields */
            margin-bottom: 10px; /* Increased margin for more space between fields */
            width: 100%;
            border: 1px solid #ccc; /* Added border to input fields */
            border-radius: 4px; /* Added border radius for rounded corners */
        }

        .Register-button {
            margin-top: 10px; /* Increased margin for more space */
            width: 100%;
            color: white;
            background-color: blue;
            padding: 16px; /* Increased padding for larger button */
            border: none;
            border-radius: 4px; /* Added border radius for rounded corners */
            font-size: 16px; /* Increased font size for better readability */
            cursor: pointer;
        }

        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            font-size: 24px;
        }

        /* Added CSS for the two-input layout */
        .name-input-container {
            display: flex;
            gap: 10px;
        }

        .name-input-container input[type="text"] {
            flex: 1;
            border: 1px solid #ccc; /* Added border to input fields */
            border-radius: 4px; /* Added border radius for rounded corners */
        }
    </style>
</head>
<body>
    <div id="registerPopup" class="register-popup">
        <div class="register-form">
            <span class="close-button" onclick="hideRegisterPopup()">&#x2716;</span>
            <h2 class="register-heading">Register</h2>
            <div>
                <div class="name-input-container">
                    <input placeholder="First name" type="text" id="rfirstname" name="rfirstname" required>
                    <input placeholder="Last name" type="text" id="rlastname" name="rlastname" required>
                </div>  
                <select class="genderBox" id="rgender" name="rgender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Others">Others</option>
                </select>
                <input maxlength="30" placeholder="Your email address" type="email" id="remail" name="remail" required>
                <input maxlength="30" placeholder="Your phone number" type="text" id="rphonenumber" name="rphonenumber" required>
                <input maxlength="40" placeholder="Your address" type="text" id="raddress" name="raddress" required>
                <input maxlength="30" placeholder="Password" type="password" id="rpassword" name="rpassword" required>
                <input maxlength="30" placeholder="Repeat Password" type="password" id="rrepeat_password" name="rrepeat_password" required>
                <button class="Register-button" onclick="attemptRegister()">Register</button> <br>
                <p id="registerResult" value=""></p>
                Already have an account, <a onclick="showLoginPopup()" href="#">login now!</a><br>
            </div>
        </div>
    </div>
    <script src="./resources/js/register-script.js"></script>
</body>
</html>
