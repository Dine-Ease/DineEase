let preveiwContainer = document.querySelector('.products-preview');

let previewBox = preveiwContainer.querySelectorAll('.preview');



document.querySelectorAll('.products-container .product').forEach(product =>{

  product.onclick = () =>{

    preveiwContainer.style.display = 'flex';

    let name = product.getAttribute('data-name');

    previewBox.forEach(preview =>{

      let target = preview.getAttribute('data-target');

      if(name == target){

        preview.classList.add('active');

      }

    });

  };

});



previewBox.forEach(close =>{

  close.querySelector('.fa-times').onclick = () =>{

    close.classList.remove('active');

    preveiwContainer.style.display = 'none';

  };

});

function addToCart(productId) {
  $.ajax({
      type: "POST",
      url: "js/add_to_cart.php", // Update the URL to the correct relative path
      data: { product_id: productId },
      success: function (response) {
          alert(response); // You can replace this with any desired feedback to the user
      },
      error: function () {
          alert("An error occurred while adding the product to the cart.");
      }
  });
}









