function charge (){

  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener('input', function(){

    const itemPriceValue = itemPrice.value
    const chargeRate = 0.1;
    const handlingFee = parseInt(itemPriceValue * chargeRate);
    const profit = parseInt(itemPriceValue - handlingFee);
    const taxArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    taxArea.innerHTML = handlingFee;
    profitArea.innerHTML = profit;
  })
}

window.addEventListener('load', charge)