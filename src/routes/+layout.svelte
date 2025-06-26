<script>
	import "$lib/env.svelte";
	import Sidebar from "$lib/components/ui/sidebar.svelte";
	let { children } = $props();
    import { onMount } from "svelte";
    import { mobile } from "$lib/store.svelte";

	let open = $state(!mobile);
</script>

<style>

:global(body) {
    background-color: var(--base);
    color: white;
    font-family: Arial, Helvetica, sans-serif;
    font-size: large;
    margin: 0px;
}

:global(::-webkit-scrollbar) {
    width: 1.25vh;
}

/* Track background */
:global(::-webkit-scrollbar-track) {
    opacity: 0;
    width: .9vh;
}

/* Scroll thumb */
:global(::-webkit-scrollbar-thumb) {
    background-color: rgba(255,255,255,0.2);
    border-radius: 5px;
}

/* On hover */
:global(::-webkit-scrollbar-thumb:hover) {
    background-color: rgba(255,255,255,0.3);
}

nav {
    display: flex;
    position: fixed;
    align-items: center;
    min-width: 100%;
    min-height: 50px;
    border-bottom: 1px solid var(--border);
    background-color: var(--base);
    padding: 0 15px;
}

button {
    background-color: transparent;
    color: white;
    border: 1px var(--border) solid;
    border-radius: var(--border-radius-2);
    width: 30px;
    height: 30px;
    margin-right: 15px;
}

</style>

<nav>

    <button onclick={() => open = !open}>
        =
    </button>
    <h3>Lwim</h3>

</nav>

<div style="padding-top: 50px;">
    <div style="display: flex; flex-direction: row;">
        <Sidebar bind:open={open}/>
        <div style="flex: 1; max-height: calc(100vh - 50px); overflow: auto;">
            {@render children?.()}
        </div>
    </div>
</div>