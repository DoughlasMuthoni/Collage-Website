


// search btn
document.getElementById('searchToggle').addEventListener('click', function () {
    const searchInput = document.getElementById('searchInput');
    searchInput.classList.toggle('show');
  });



document.querySelectorAll('.dropdown-submenu').forEach(function (submenu) {
  submenu.addEventListener('mouseover', function () {
      const dropdown = submenu.querySelector('.dropdown-menu');
      if (dropdown) {
          dropdown.classList.add('show');
      }
  });

submenu.addEventListener('mouseout', function () {
    const dropdown = submenu.querySelector('.dropdown-menu');
    if (dropdown) {
        dropdown.classList.remove('show');
    }
  });
});
// Get the back-to-top button
const backToTopButton = document.querySelector('.back-to-top');

  // Show or hide the button based on the scroll position
window.addEventListener('scroll', function() {
    if (window.scrollY > 300) { // Show the button after scrolling 300px
      backToTopButton.classList.add('active');
      } 
    else {
      backToTopButton.classList.remove('active');
    }
});

  // Scroll smoothly to the top when clicked
backToTopButton.addEventListener('click', function(event) {
  event.preventDefault();
  window.scrollTo({ top: 0, behavior: 'smooth' });
});

// contact page

src="https://kit.fontawesome.com/a076d05399.js"
    crossorigin="anonymous"



// Toggle dropdowns on mobile
document.querySelectorAll('.dropdown-submenu > a').forEach(function (submenu) {
  submenu.addEventListener('click', function (e) {
      e.preventDefault();
      const parent = this.closest('.dropdown-submenu');
      parent.classList.toggle('open');
  });
});

// Close other dropdowns when one is opened
document.querySelectorAll('.nav-item.dropdown > a').forEach(function (dropdown) {
  dropdown.addEventListener('click', function () {
      document.querySelectorAll('.nav-item.dropdown').forEach(function (item) {
          if (item !== dropdown.closest('.nav-item')) {
              item.classList.remove('open');
          }
      });
  });
});
setTimeout(() => {
  const alertBox = document.getElementById('message-alert');
  if (alertBox) {
      alertBox.style.display = 'none';
  }
}, 5000);


document.addEventListener("DOMContentLoaded", function () {
  const alertBox = document.getElementById("message-alert");
  if (alertBox) {
      setTimeout(function () {
          alertBox.style.display = "none";
      }, 5000); // 5000ms = 5 seconds
  }
});