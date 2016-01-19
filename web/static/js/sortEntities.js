const selectSort = document.querySelector("#sort");

const sortEntities = () => {
  const sortvalue = selectSort.value;
  const entityList = document.querySelector(".entity-list")
  const entity = document.querySelectorAll(".entity");
  const entityArray = Array.prototype.slice.call(entity);
  entityArray.sort((a, b) =>
    a.querySelector(`.${sortvalue}`).textContent.localeCompare(b.querySelector(`.${sortvalue}`).textContent))
    .forEach(function (item) {
      entityList.appendChild(item);
    });
};

if (selectSort != null) {
  selectSort.addEventListener("change", sortEntities);
}


export default sortEntities;