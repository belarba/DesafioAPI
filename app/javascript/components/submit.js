const addEvent = () => {
  const commentForm = document.querySelector('#add-form');

  const postMessage = (event, timestamp) => {
    fetch("http://localhost:3000/api/v1/desafios", {
      method: "POST",
      headers: { 'Content-type': 'application/json' },
      body: JSON.stringify({ event: event, timestamp: timestamp })
    })
      .then(response => response.json());
  };

  commentForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const event_add = document.querySelector('#event');
    const posted = postMessage(event_add.value, new Date());
    location.reload();
  });
}

export { addEvent }
