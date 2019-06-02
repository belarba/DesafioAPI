const autoComplete = () => {
  const input = document.querySelector('#search');
  const results = document.querySelector('#results');

  const searchWord = (query) => {
    fetch(`http://localhost:3000/api/v1/desafios/event/${query}`)
      .then(response => response.json())
      .then((result) => {
        result.data.forEach((event) => {
          const word = `<li>
            <p>${event.event}</p>
          </li>`;
          results.insertAdjacentHTML("beforeend", word);
        })

      });
  };

  input.addEventListener('keyup', (event) => {
    results.innerHTML = '';
    if (event.currentTarget.value.length > 1) {
      searchWord(event.currentTarget.value);
    }

  });
}

export { autoComplete }


