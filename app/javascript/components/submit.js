const addEvent = () => {
  const commentForm = document.querySelector('#add-form');

  console.log("Opa");

  const postMessage = (event, timestamp) => {
    fetch("http://localhost:3000/api/v1/desafios", {
      method: "POST",
      body: JSON.stringify({ event: event, timestamp: timestamp })
    })
      .then(response => response.json())
      .then((data) => {
        fillListLocal(data);
      });
  };

  commentForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const event_add = document.querySelector('#event');
    console.log("submeteu");
    // const posted = postMessage(event_add.value, new Date());
  });
}




export { addEvent }
