Kitodo Presentation
===================================

This provides a docker composition to set up the DFG Viewer and Kitodo Presentation

Building
--------
    docker-compose up
      
Configuration
--------
* Go to http://localhost:8033/typo3
* Login with `password`
* Change db host from `127.0.0.1` to `db`

Go to the backend admin.
* Continue with username `admin` and password `password`



Enable these extensions:
1. Static Info Tables	
2. T3 jQuery
3. Kitodo Presentation
4. DFG Viewer

Build T3 jQuery (select all, merge and use, and Create Jquery Library)

That is it.

Check that it works by loading this URI:

    http://localhost:8033/index.php?id=1&tx_dlf%5Bpage%5D=1&tx_dlf%5Bid%5D=http%3A%2F%2Fdbs.hab.de%2Foai%2Fwdb%3Fverb%3DGetRecord%26metadataPrefix%3Dmets%26identifier%3Doai%3Adiglib.hab.de%3Appn_549837965&tx_dlf%5Bdouble%5D=0&cHash=9d7485215e026d26e3378be7140fbdc7