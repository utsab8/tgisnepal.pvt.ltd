// Simple navbar loader
document.addEventListener('DOMContentLoaded', function() {
    const navbarContainer = document.getElementById('global-navbar-container');
    
    if (navbarContainer) {
        // Insert the global navbar directly
        navbarContainer.innerHTML = `
        <nav class="navbar">
            <div class="nav-container">
                <a href="index.html" class="logo">
                    <div class="logo-icon">T</div>
                    <span>TGIS <span style="color: #333;">Nepal</span></span>
                </a>
                <ul class="nav-menu">
                    <li class="nav-item"><a href="index.html" class="nav-link active">Home</a></li>
                    <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
                    <li class="nav-item"><a href="services.html" class="nav-link">Services</a></li>
                    <li class="nav-item"><a href="portfolio.html" class="nav-link">Portfolio</a></li>
                    <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
                </ul>
                <div class="hamburger">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </div>
            </div>
        </nav>`;
        
        // Add mobile menu toggle functionality
        setTimeout(() => {
            const hamburger = document.querySelector('.hamburger');
            if (hamburger) {
                hamburger.addEventListener('click', function() {
                    const navMenu = document.querySelector('.nav-menu');
                    navMenu.classList.toggle('active');
                    this.classList.toggle('active');
                });
            }
        }, 100);
    }
});