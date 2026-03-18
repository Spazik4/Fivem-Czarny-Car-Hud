window.addEventListener("message", function (event) {
    const data = event.data;
    const hud = document.getElementById("hud");

    if (data.action === "show") {
        hud.style.display = "block";
        document.getElementById("speed").textContent = data.speed ?? 0;
        document.getElementById("direction").textContent = data.direction ?? "N";
        document.getElementById("street").textContent = data.street ?? "Unknown Street";
    }

    if (data.action === "hide") {
        hud.style.display = "none";
    }
});
