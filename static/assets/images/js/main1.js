


document.getElementById('searchToggle').addEventListener('click', function (event) {
  event.preventDefault(); // Prevent form submission if the button is inside a form
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

document.addEventListener('DOMContentLoaded', function () {
  // Handle click event for dropdowns on small screens
  const dropdownItems = document.querySelectorAll('.nav-item.dropdown');

  dropdownItems.forEach(item => {
      item.addEventListener('click', function (e) {
          // Toggle dropdown visibility
          if (window.innerWidth <= 767) {
              const dropdownMenu = item.querySelector('.dropdown-menu');
              dropdownMenu.classList.toggle('show'); // Toggle visibility of the menu
          }
      });
  });
});


document.addEventListener("DOMContentLoaded", function () {
  const counters = document.querySelectorAll('.counter');

  counters.forEach(counter => {
      const updateCount = () => {
          const target = +counter.getAttribute('data-target'); // Target number
          const count = +counter.innerText; // Current number
          const increment = target / 100; // Increment value

          if (count < target) {
              counter.innerText = Math.ceil(count + increment);
              setTimeout(updateCount, 10); // Adjust speed by changing the timeout value
          } else {
              counter.innerText = target; // Set to target if exceeded
          }
      };

      updateCount();
  });
});


// Populate counties
fetch('/get-counties/')
.then(response => response.json())
.then(data => {
    const countySelect = document.getElementById('id_county');
    data.counties.forEach(county => {
        const option = document.createElement('option');
        option.value = county;
        option.textContent = county;
        countySelect.appendChild(option);
    });
})
.catch(error => console.error('Error fetching counties:', error));

// Populate courses based on selected department
const departmentSelect = document.getElementById('id_department');
const courseSelect = document.getElementById('id_course');

departmentSelect.addEventListener('change', function () {
const departmentId = this.value;

// Clear existing courses
courseSelect.innerHTML = '<option value="" disabled selected>Select a course</option>';

fetch(`/get-courses/${departmentId}/`)
    .then(response => response.json())
    .then(data => {
        data.courses.forEach(course => {
            const option = document.createElement('option');
            option.value = course.id;
            option.textContent = course.course_name;
            courseSelect.appendChild(option);
        });
    })
    .catch(error => console.error('Error fetching courses:', error));
});


