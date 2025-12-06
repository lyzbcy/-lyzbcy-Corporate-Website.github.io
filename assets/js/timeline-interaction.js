// Timeline Filtering Logic
document.addEventListener('DOMContentLoaded', function () {
    const container = document.getElementById('tree-container');
    if (!container) return; // Guard clause

    const filters = document.querySelectorAll('.filter-btn');

    // 1. Handle Filter Clicks
    filters.forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.stopPropagation(); // Prevent bubbling to document

            const filterType = btn.getAttribute('data-filter');
            const targetClass = `filtering-${filterType}`;

            // If already active, clear it (Toggle behavior)
            if (container.classList.contains(targetClass)) {
                container.classList.remove(targetClass);
            } else {
                // Clear all others first
                container.classList.remove('filtering-school', 'filtering-personal', 'filtering-team');
                // Activate new one
                container.classList.add(targetClass);
            }
        });
    });

    // 2. Click outside to reset
    document.addEventListener('click', (e) => {
        // If click is NOT on a tree item (optional: let user inspect items without closing)
        // For now, simple "click anywhere else" resets
        if (!e.target.closest('.filter-btn')) {
            container.classList.remove('filtering-school', 'filtering-personal', 'filtering-team');
        }
    });
});
