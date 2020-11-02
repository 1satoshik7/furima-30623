window.addEventListener("load", price);
function price() {
  const input = document.getElementById("item-price");
  const input2 = document.getElementById("add-tax-price");
  const input3 = document.getElementById("profit");
  input.addEventListener("input", () => {
    const input_user = document.getElementById("item-price").value;
    input2.innerHTML = input_user * 0.1
    input3.innerHTML = input_user - (input_user * 0.1)
  });
}
