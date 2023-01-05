package snippet;

public class Snippet {
	public static void main(String[] args) {
		#scroll_area {
		  overflow-y: scroll;
		}
		      .nav-scroller {
		        position: relative;
		        z-index: 2;
		        height: 2.75rem;
		        overflow-y: hidden;
		      }
		
		      .nav-scroller .nav {
		        display: flex;
		        flex-wrap: nowrap;
		        padding-bottom: 1rem;
		        margin-top: -1px;
		        overflow-x: auto;
		        text-align: center;
		        white-space: nowrap;
		        -webkit-overflow-scrolling: touch;
		      }
	}
}

