<script lang="ts">
    import { text } from "@sveltejs/kit";

    let {
        buffer = $bindable(""),
        multiline = "false",
        slass="input",
        style="",
        ...others
    } = $props();

    function resize(textarea) {
        textarea = textarea.target;
        textarea.style.height = 'auto';
        textarea.style.height = textarea.scrollHeight+1 + 'px';
    }   
</script>

<style>
    .base {
        background-color: var(--base);
        color: white;
        width: 100%;
        resize: none;
        font-family: var(--font);
    }

    .input {
        /* background-color: var(--secondary); */
        border: 1px var(--border) solid;
        border-radius: var(--border-radius-2);
        padding: 7px 10px;
    }

    .transparent {
        /* background-color: var(--secondary); */
        border: 0;
        padding: 0;
        font-size: large;
    }

    .transparent:focus {
        outline: 0;
    }
</style>

{#if multiline === "true"}
    <textarea {...others} style={style} oninput={resize} class="base {slass}" bind:value={buffer}></textarea>
{:else}
    <input {...others} style={style} class="base {slass}" bind:value={buffer}>
{/if}