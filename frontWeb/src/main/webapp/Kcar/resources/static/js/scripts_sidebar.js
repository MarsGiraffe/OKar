/*!
* Start Bootstrap - Simple Sidebar v6.0.6 (https://startbootstrap.com/template/simple-sidebar)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-simple-sidebar/blob/master/LICENSE)
*/
// 
// Scripts
// 

function kind_Car(){
    let click = document.getElementById("kind_Car");
    if(click.style.display === "none"){
        click.style.display = "block";
    }else{
        click.style.display = "none";
    }
}
function kind_Car2(){
    let click = document.getElementById("kind_Car2");
    if(click.style.display === "none"){
        click.style.display = "block";
    }else{
        click.style.display = "none";
    }
}
function company_Car(){
    let click = document.getElementById("company_Car");
    if(click.style.display === "none"){
        click.style.display = "block";
    }else{
        click.style.display = "none";
    }
}
function model_Car(){
    let click = document.getElementById("model_Car");
    if(click.style.display === "none"){
        click.style.display = "block";
    }else{
        click.style.display = "none";
    }
}
function year_Car(){
    let click = document.getElementById("year_Car");
    if(click.style.display === "none"){
        click.style.display = "block";
    }else{
        click.style.display = "none";
    }
}
function diriving_Car(){
    let click = document.getElementById("diriving_Car");
    if(click.style.display === "none"){
        click.style.display = "block";
    }else{
        click.style.display = "none";
    }
}
function pay_Car(){
    let click = document.getElementById("pay_Car");
    if(click.style.display === "none"){
        click.style.display = "block";
    }else{
        click.style.display = "none";
    }
}
function pay_Car2(){
    let click = document.getElementById("pay_Car2");
    if(click.style.display === "none"){
        click.style.display = "block";
    }else{
        click.style.display = "none";
    }
}
function option_Car(){
    let click = document.getElementById("option_Car");
    if(click.style.display === "none"){
        click.style.display = "block";
    }else{
        click.style.display = "none";
    }
}
function fuel_Car(){
    let click = document.getElementById("fuel_Car");
    if(click.style.display === "none"){
        click.style.display = "block";
    }else{
        click.style.display = "none";
    }
}
function crush_Car(){
    let click = document.getElementById("crush_Car");
    if(click.style.display === "none"){
        click.style.display = "block";
    }else{
        click.style.display = "none";
    }
}

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});

