var selected_row = null;

function start_app()
{
    const address = document.getElementById("input_url").value;
    window.splash.start(address);
}

function on_table_row_click()
{
    if (selected_row != null)
    {
        selected_row.classList.remove("table-primary");
    }

    selected_row = this;
    this.classList.add("table-primary");
    var input = document.getElementById("input_url");
    input.value = this.cells[1].innerHTML;
}

function on_ip_search(event, result)
{
    var table = document.getElementById("table_ip_results");
    console.log("Got host at IP " + result["ip"]);
    // Create an empty <tr> element and add it to the 1st position of the table:
    var row = table.insertRow();
    row.onclick = on_table_row_click;

    // Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
    var cell_hostname = row.insertCell(0);
    var cell_address = row.insertCell(1);
    var cell_interface = row.insertCell(2);

    // Add some text to the new cells:
    cell_hostname.innerHTML = result["name"];
    cell_address.innerHTML = result["ip"]; 
    cell_interface.innerHTML = result["interface"];
}

function start_search()
{
    // Clear search results
    selected_row = null;
    document.getElementById("table_ip_results").innerHTML = "";

    window.splash.ip_search.start();
    window.splash.ip_search.on_result(on_ip_search);
}

document.getElementById("button_start_app").onclick = start_app;
document.getElementById("button_search").onclick =    start_search;