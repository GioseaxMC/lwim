<style>

:global(:root) {
	--base: rgb(12,12,12);
	--primary: rgb(25,25,25);
	--primary-hover: rgb(35,35,35);
	--secondary: rgb(35,35,35);
	--secondary-hover: rgb(45,45,45);
	--border: rgb(45,45,45);
	--border-secondary: rgb(70,70,70);
	--border-radius: 12px;
	--border-radius-2: 7px;
	
	--main: rgb(150,255,150);
	--red: rgb(2250,100,100);

	--text-main: white;
	--text-second: gray;

	--font: Arial, Helvetica, sans-serif;
}

/* Simple reset */
:global(*) {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

:global(.st) {
	font-size: small;
}

:global(hr) {
	margin: 10px 0;
	border: 0;
	border-top: 1px var(--border) solid;
}

</style>