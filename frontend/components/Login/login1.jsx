const container=document.querySelector('.container');
const LoginLink=document.querySelector('.SignInLink');
const RegiLink=document.querySelector('.SignUpLink');
RegiLink.addEventListener('click', ()=>{
    container.classList.add('active');
})
LoginLink.addEventListener('click', ()=>{
    container.classList.remove('active');
})