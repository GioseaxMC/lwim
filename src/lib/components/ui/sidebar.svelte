<script>
    import Button from "$lib/components/ui/Button.svelte";
    import { goto, invalidate } from "$app/navigation";
    import { user, base, mobile } from "$lib/store.svelte";
    
    let { open = $bindable(true), ...other } = $props();

    function menu_goto(link) {
        goto(link);
        if (mobile) {
            open = 0;
        }
    }

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
    <nav {...other}> 
        <h4>Menu</h4>
        <hr>
        <div style="flex: 1; overflow-y: scroll; margin: 15px 0">
            <div style="display: grid; gap: 5px;">
                <Button style="style-3" text="🏠 Home" onclick={()=>menu_goto(base)}/>
            </div>
        </div>
        <div style="margin-top: auto">
            {#if user.id}
                <Button style="style-3" text="⚙️ Settings" onclick={()=>{menu_goto(base+"settings")}}/>
                <Button style="style-3" text="🗣️ Profile" onclick={()=>{menu_goto(base+"user?name="+user.name)}}/>
                <Button style="style-3" text="‼️ Logout" onclick={()=>{menu_goto(base+"login")}}/>
            {:else}
                <Button style="style-3" text="❔ Login" onclick={()=>{menu_goto(base+"login")}}/>
            {/if}
        </div>
    </nav>
{/if}