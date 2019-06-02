const input = document.querySelector('#search');
const results = document.querySelector('#results');

const searchWord = (query) => {
  console.log(query);
  fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${query}`)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      data.words.forEach((result) => {
        console.log(result);
        const word = `<li>
          <p>${result}</p>
        </li>`;
        results.insertAdjacentHTML("beforeend", word);
      });
    });
};

input.addEventListener('keyup', (event) => {
  results.innerHTML = '';
  searchWord(event.currentTarget.value);
});
