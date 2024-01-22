function Dialog(idForm, idBtn, where, attribute, type) {
    document.addEventListener("DOMContentLoaded", () => {
        $(idForm).on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            id = button.data('id') // Extract info from data-* attributes
        })
        const btnDelete = document.querySelector(idBtn)
        btnDelete.addEventListener('click', async () => {

            const xhr = new XMLHttpRequest();
            const url = `http://localhost:8080/Movie_Ticket_Website_war/${where}?${attribute}=${id}`;


            xhr.open(type === 'delete' ? 'DELETE' : type === 'put' ? 'PUT' : 'POST', url, true);

            xhr.onload = function () {
                if (xhr.status === 200) {
                    const data = JSON.parse(xhr.responseText);
                    alert(data.message);
                    location.reload();
                } else if (xhr.status === 500) {
                    const data = JSON.parse(xhr.responseText);
                    alert(data.message);
                }
            };

            xhr.send();
        })
    })
}

Dialog()