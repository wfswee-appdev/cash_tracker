import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["entries", "pagination"]

  scroll() {   
    let url = this.paginationTarget.querySelector("a[rel='next']").href
    var body = document.body,
      html = document.documentElement
    
    var height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)

    if(window.pageYOffset >= height - window.innerHeight) {
      console.log("bottom")
      this.loadMore(url)
    }
  }
  loadMore(url) {
    RadioNodeList.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        console.log(data)
      }
    })
  }
}