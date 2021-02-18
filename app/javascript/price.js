function price() {
  const itemPriceCalc = document.getElementById('item-price');
  itemPriceCalc.addEventListener('keyup', () => {
    const itemPriceNum = itemPriceCalc.value;
    const addTaxPriceNum = Math.floor(itemPriceNum / 10);
    const ProfitNum = itemPriceNum - addTaxPriceNum;
    const addTaxPrice = document.getElementById('add-tax-price');
    const Profit = document.getElementById('profit');
    addTaxPrice.innerHTML = `${addTaxPriceNum}`;
    Profit.innerHTML = `${ProfitNum}`;
  });
};

window.addEventListener('load', price);