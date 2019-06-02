const updateJson = () => {
  const jsonArea = document.querySelector('#myTextarea');

  const fetchInfo = (() => {
    fetch("http://localhost:3000/api/v1/desafios")
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        jsonArea.innerHTML = JSON.stringify(data, undefined, 4);


      });
  });

  fetchInfo();
}

export { updateJson }

