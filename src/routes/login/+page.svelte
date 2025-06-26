<script lang="ts">
    import "$lib/env.svelte";
    import { api, user, get_display, base } from "$lib/store.svelte.js";
    import Input from "$lib/components/ui/Input.svelte";
    import Button from "$lib/components/ui/Button.svelte";
    import { goto } from "$app/navigation";

    let username = $state("");
    let password = $state("");
    let error_message = $state("");
    let state_message = $state("");
    let usern = $derived(username.length ? username : "user");

    function handle_login(e) {
        e.preventDefault();

        state_message = "Processing...";
        error_message = "";

        if (
            !username.length ||
            !password.length
        ) {
            error_message = "Please fill all field (pun intended).";
            state_message = "";
            return;
        }
        
        let formdata = new FormData(e.target);
        formdata.append("usertoken", user.token);

        let endpoint = api + "login.php";

        fetch(
            endpoint, {
            method: "POST",
            body: formdata,
        }).then( response => {
            state_message = "";
            if (response.status >= 200 && response.status < 300) {
                response.json().then(data => {
                    user.id = data[0];
                    user.name = data[1];
                    user.token = data[4];
                    user.display = data[5];
                    user.colorscheme = data[6];
                    user.pfp = data[7];
                    state_message = "Redirecting...";
                    goto(base);
                });
            } else {
                response.text().then(text => {
                    error_message = text;
                });
            }
        });
    }

</script>
<style>

.login {
    display: grid;
    gap: 5px;
    border: 1px var(--border) solid;
    background-color: var(--primary);
    padding: 20px;
    border-radius: var(--border-radius);
    width: 300px;
}

.center-container {
	display: flex;
	justify-content: center;
	margin: 15px;
}

</style>

<div class="center-container">
    <div class="login">
        <h3>Login</h3>
        <p class="st" style="color: var(--text-second)">Hello {usern}!</p>
        <br>
        <form onsubmit={handle_login}>
            <label class="st">
                Username
                <br>
                <Input id="username" name="username" required autocomplete="on" bind:buffer={username}/>
            </label>
            <br>
            <br>
            <label class="st">
                Password
                <br>
                <Input type="password" id="password" name="password" required autocomplete="on" bind:buffer={password}/>
            </label>
            <br>
            <br>
            <p class="st" style="color: var(--red);">{error_message}</p>
            <p class="st" style="color: var(--border-secondary);">{state_message}</p>
            <br>
            <Button text="Sign in" type="submit"/>
        </form>
    </div>
</div>