window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  console.log(priceInput);
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);


  const priceAddTax = document.getElementById('add-tax-price');
  console.log(priceAddTax);
  priceAddTax.innerHTML = Math.floor(inputValue / 10)

  const priceProfit = document.getElementById('profit');
  console.log(priceProfit);
  priceProfit.innerHTML = Math.floor(inputValue - priceAddTax.innerHTML)
})
});
