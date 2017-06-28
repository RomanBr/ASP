var arr = ["Duduk", "Guitar", "Sitar", "Tar", "Bouzouki", "Darbouka", "Fiddle"];
window.onload = function () {
			var name = arr[Math.floor(Math.random() * arr.length)];
			var link1 =  document.getElementById("link");
			link1.innerHTML = name;
			link1.title = name;
			link1.href = name + ".asp";
}
