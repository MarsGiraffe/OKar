/*!
* Start Bootstrap - Shop Item v5.0.6 (https://startbootstrap.com/template/shop-item)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-item/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

// 세금 및 부대비용(이전등록비 + 관리비 + 대행수수료)

function monthly(m){
	var carPrice = document.querySelector("#carCost").value;
	var month = m.val;
	var monthCost = carPrice/month;
	
	console.log(carPrice);
	console.log(month);
	console.log(monthCost);
	var monthlyCost = document.querySelector("#monthlyCost");
	monthlyCost.innerText = "월 "+parseInt(monthCost)+"원";
}
