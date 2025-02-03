


document.addEventListener("DOMContentLoaded", function () {
    const searchToggle = document.getElementById("searchToggle");
    const searchInput = document.getElementById("searchInput");
    const searchForm = searchInput.closest("form");

    searchToggle.addEventListener("click", function (event) {
        event.preventDefault(); // Prevent unintended form submission

        // Toggle visibility of the search input
        searchInput.classList.toggle("show");

        if (searchInput.classList.contains("show")) {
            searchInput.style.display = "block";
            searchInput.focus(); // Auto-focus when shown
        } else {
            searchInput.style.display = "none";

            // If input has text, submit search on second click
            if (searchInput.value.trim() !== "") {
                searchForm.submit();
            }
        }
    });

    // Allow "Enter" key to submit the search
    searchInput.addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            event.preventDefault(); // Prevent default form submission
            searchForm.submit();
        }
    });
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
          if (window.innerWidth <= 992) {
              const dropdownMenu = item.querySelector('.dropdown-menu');
              dropdownMenu.classList.toggle('show'); // Toggle visibility of the menu
          }
      });
  });
});


document.addEventListener("DOMContentLoaded", function () {
    const counters = document.querySelectorAll(".counter");
  
    // Function to animate the counter
    const animateCounter = (counter) => {
      const target = +counter.getAttribute("data-target"); // Target number
      const updateCount = () => {
        const count = +counter.innerText.replace("+", "") || 0; // Current number
        const increment = target / 100; // Increment value
  
        if (count < target) {
          counter.innerText = `${Math.ceil(count + increment)}+`;
          setTimeout(updateCount, 10); // Adjust speed by changing the timeout value
        } else {
          counter.innerText = `${target}+`; // Set to target if exceeded
        }
      };
  
      updateCount();
    };
  
    // Observe when counters enter the viewport
    const observer = new IntersectionObserver(
      (entries, observer) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            const counter = entry.target;
            animateCounter(counter);
            observer.unobserve(counter); // Stop observing once animation starts
          }
        });
      },
      { threshold: 0.5 } // Trigger when 50% of the element is visible
    );
  
    counters.forEach((counter) => {
      observer.observe(counter);
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


document.querySelectorAll('.section-title').forEach(title => {
          title.addEventListener('click', function () {
              const icon = this.querySelector('.toggle-icon');
              if (icon.textContent === '+') {
                  icon.textContent = '-';
              } else {
                  icon.textContent = '+';
              }
          });
      });



