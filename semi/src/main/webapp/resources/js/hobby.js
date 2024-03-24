const images = document.querySelectorAll('.main_category img');

images.forEach((image) => {
    image.addEventListener('click', () => {
        const categoryCard = image.closest('.category_card');
        const subCategory = categoryCard.querySelector('.sub_category');

        if (subCategory.style.display === 'block') {
            subCategory.style.display = 'none';
            image.src = 'img/down.png';
        } else {
            subCategory.style.display = 'block';
            image.src = 'img/up.png';
        }
    });
});

document.getElementById('fin_btn').addEventListener('click', (event) => {
    if (event.target.id === 'fin_btn') {
        const checkedCheckboxes = document.querySelectorAll('.category_card input[type="checkbox"]:checked');
        if (checkedCheckboxes.length < 3) {
            event.preventDefault();
            alert('최소 3개를 선택해야 합니다!');
        }
    }
});
