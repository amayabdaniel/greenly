import { Controller } from "@hotwired/stimulus"
import swal from "sweetalert";
// Connects to data-controller="sweetalert"
export default class extends Controller {
  static targets = [ "deleteButton" ]
  confirmAlert() {
    swal({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      icon: "warning",
      buttons: true,
      dangerMode: true,

    }).then ((willDelete) => {
      if (willDelete) {
        const link = this.deleteButtonTarget;
        link.click();
      }
    });
  }
}
