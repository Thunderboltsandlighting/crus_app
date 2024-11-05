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
  
    document.querySelector("#add_brewing_salt").addEventListener("click", (e) => {
      e.preventDefault();
      const link = e.target;
      const association = "brewing_salts";
      const content = document.querySelector("#brewing_salts_template").innerHTML;
      addFields(link, association, content);
    });
  });