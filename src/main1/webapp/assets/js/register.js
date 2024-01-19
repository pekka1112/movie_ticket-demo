
const form = document.getElementById('form');
const password = document.getElementById('password');
const retypePassword = document.getElementById('retypePassword');


console.log(status)
form.addEventListener('submit', (e) =>{
    e.preventDefault();
    checkInput();

});

function checkInput(){
    const passwordValue = password.value.trim();
    const retypePasswordValue = retypePassword.value.trim();


    if (passwordValue.length < 6){
        setErrorFor(password, 'Password must be at least 6 characters');
    }

    if(passwordValue !== retypePasswordValue) {
        setErrorFor(retypePassword, 'Passwords does not match');

    }
    if (passwordValue.length >= 6 && passwordValue === retypePasswordValue) {
        document.getElementById('status').value = 'success';
        form.submit();
    }

}

function setErrorFor(input, message) {
    const formControl = input.parentElement;
    const small = formControl.querySelector('small');
    formControl.className = 'input-box error';
    small.innerText = message;
}











