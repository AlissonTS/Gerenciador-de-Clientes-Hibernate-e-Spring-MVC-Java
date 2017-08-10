        <div id="footer">
            <footer class="footer" style="margin-top: 1%;">
                <c:if test="${not empty us}">
                    <div class="row" style="margin-left: 0px; margin-right: 0px;">
                        <div class="col-md-offset-9 col-md-3 col-xs-offset-4 col-xs-8">
                            <p class="text-center" style="font-size: 13px"><c:out value="${us.emailUsuario}" escapeXml="true"/></p>
                        </div>
                    </div>
                </c:if>
                <div class="row" style="margin-left: 0px; margin-right: 0px;">
                    <div class="col-md-offset-3 col-md-6 col-xs-offset-2 col-xs-8">
                        <p class="text-center" style="font-family: opensans, sans-serif;">2017 Company All rights reserved - AlissonTS7</p>
                    </div>
                </div>
            </footer>
        </div>