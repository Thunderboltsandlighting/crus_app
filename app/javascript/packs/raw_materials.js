document.addEventListener("DOMContentLoaded", () => {
    const mpqField = document.querySelector("#raw_material_mpq");
    const costPerMpqField = document.querySelector("#raw_material_cost_per_mpq");
    const costPerUomField = document.querySelector("#raw_material_cost_per_uom");
  
    function calculateCostPerUom() {
      const mpq = parseFloat(mpqField.value);
      const costPerMpq = parseFloat(costPerMpqField.value);
  
      if (!isNaN(mpq) && !isNaN(costPerMpq) && mpq > 0) {
        const costPerUom = costPerMpq / mpq;
        costPerUomField.value = `$${costPerUom.toFixed(2)}`;
      } else {
        costPerUomField.value = "";
      }
    }
  
    mpqField.addEventListener("input", calculateCostPerUom);
    costPerMpqField.addEventListener("input", calculateCostPerUom);
  });