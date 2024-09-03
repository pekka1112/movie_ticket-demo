
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
            setErrorFor(password, 'Mật khẩu phải có sit nhất 6 kí tự');
        }
        if(passwordValue !== retypePasswordValue) {
            setErrorFor(retypePassword, 'Nhập lại mật khẩu không trùng khớp');
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











