document.addEventListener("DOMContentLoaded", () => {
    function addFields(link, association, content) {
      const newId = new Date().getTime();
      const regexp = new RegExp("new_" + association, "g");
      link.insertAdjacentHTML("beforebegin", content.replace(regexp, newId));
    }
  
    document.querySelectorAll(".remove_fields").forEach((link) => {
      link.addEventListener("click", (e) => {
        e.preventDefault();
        link.previousElementSibling.value = "1";
        link.closest(".nested-fields").style.display = "none";
      });
    });
  
    document.querySelector("#add_grain").addEventListener("click", (e) => {
      e.preventDefault();
      const link = e.target;
      const association = "grains";
      const content = document.querySelector("#grains_template").innerHTML;
      addFields(link, association, content);
    });
  
    document.querySelector("#add_hop").addEventListener("click", (e) => {
      e.preventDefault();
      const link = e.target;
      const association = "hops";
      const content = document.querySelector("#hops_template").innerHTML;
      addFields(link, association, content);
    });
  
    document.querySelector("#add_yeast").addEventListener("click", (e) => {
      e.preventDefault();
      const link = e.target;
      const association = "yeasts";
      const content = document.querySelector("#yeasts_template").innerHTML;
      addFields(link, association, content);
    });
  
    document.querySelector("#add_misc").addEventListener("click", (e) => {
      e.preventDefault();
      const link = e.target;
      const association = "miscs";
      const content = document.querySelector("#misc_template").innerHTML;
      addFields(link, association, content);
    });
  
    // Autocomplete and calculations
    function setupAutocompleteAndCalculations() {
      document.querySelectorAll(".grain-autocomplete, .hop-autocomplete, .yeast-autocomplete, .misc-autocomplete").forEach((input) => {
        const inventory = JSON.parse(input.dataset.inventory);
        new Awesomplete(input, {
          list: inventory.map(item => item.name),
        });
  
        input.addEventListener("awesomplete-selectcomplete", (e) => {
          const selectedItem = inventory.find(item => item.name === e.text.value);
          if (selectedItem) {
            const parent = input.closest(".nested-fields");
            parent.querySelector(".uom-input").value = selectedItem.uom;
            parent.querySelector(".amount-input").addEventListener("input", (e) => {
              const amount = parseFloat(e.target.value);
              const totalCost = amount * selectedItem.cost_per_uom;
              parent.querySelector(".total-cost-input").value = totalCost.toFixed(2);
            });
          }
        });
      });
    }
  
    setupAutocompleteAndCalculations();
  });