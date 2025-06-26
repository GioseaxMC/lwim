<script>
    import Button from "$lib/components/ui/Button.svelte";
    import { goto, invalidate } from "$app/navigation";
    import { user, base } from "$lib/store.svelte";
    
    let { open = $bindable(true) } = $props();

</script>

<style>

nav {
    display: flex;
    flex-direction: column;
    background-color: var(--primary);
    border-right: 1px solid var(--border);

    min-height: calc(100vh - 50px);
    max-width: 300px;

    padding: 15px;
    flex: 1;
}

</style>

{#if open}
    <nav>
        <h4>Menu</h4>
        <hr>
        <div style="flex: 1; overflow-y: scroll; margin: 15px 0">
            <div style="display: grid; gap: 5px;">
                <Button style="style-3" text="🏠 Home" onclick={()=>goto(base)}/>
            </div>
        </div>
        <div style="margin-top: auto">
            {#if user.id}
                <Button style="style-3" text="⚙️ Settings" onclick={()=>{goto(base+"settings")}}/>
                <Button style="style-3" text="🗣️ Profile" onclick={()=>{goto(base+"user?name="+user.name)}}/>
                <Button style="style-3" text="‼️ Logout" onclick={()=>{goto(base+"login")}}/>
            {:else}
                <Button style="style-3" text="❔ Login" onclick={()=>{goto(base+"login")}}/>
            {/if}
        </div>
    </nav>
{/if}