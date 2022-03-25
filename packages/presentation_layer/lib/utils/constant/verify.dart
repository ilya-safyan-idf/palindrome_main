const String emptyLoginError = 'Empty login';
const String emptyPasswordError = 'Empty password';
const String baseLoginError = 'Wrong login';
const String basePasswordError = 'Wrong password';
const String passwordValidRule =
    r"(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{6,}";
const String loginValidRule =
    r'^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$';
