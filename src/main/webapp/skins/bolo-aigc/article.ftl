<#--

    Bolo - A stable and beautiful blogging system based in Solo.
    Copyright (c) 2020, https://github.com/adlered

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<#-- Bolo - A stable and beautiful blogging system based in Solo. Copyright (c) 2020, https://github.com/adlered This
    program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public
    License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
    version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
    implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License
    for more details. You should have received a copy of the GNU Affero General Public License along with this program.
    If not, see <https://www.gnu.org/licenses/>. -->
    <#-- Solo - A small and beautiful blogging system written in Java. Copyright (c) 2010-present, b3log.org This
        program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General
        Public License as published by the Free Software Foundation, either version 3 of the License, or (at your
        option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY
        WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
        Affero General Public License for more details. You should have received a copy of the GNU Affero General Public
        License along with this program. If not, see <https://www.gnu.org/licenses/>. -->
<#include "../../common-template/macro-common_head.ftl">
<#include "macro-comments.ftl">
<#include "../../common-template/macro-comment_script.ftl">

<!DOCTYPE html>
    <html>
        <head>
            <@head title="${article.articleTitle} - ${blogTitle}"
                description="${article.articleAbstract?html}">
                <link rel="stylesheet" href="${staticServePath}/js/lib/bulma.min.css" />
                <link rel="stylesheet" href="https://ftp.stackoverflow.wiki/bolo/fantastic/css/all.min.css">
                <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}" />
                <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/style.css?${staticResourceVersion}" />
                     <link rel="stylesheet" href="${staticServePath}/js/lib/swiper.min.css">
                <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/detail.css?${staticResourceVersion}" />
        <script src='${staticServePath}/js/lib/swiper.min.js'></script>
            </@head>
            <#-- <#include "style.theme.ftl"> -->
        </head>
            <body class="is-3-column">
                <!-- <#include "header.ftl"> -->
                <script>
                    var loggedIn = ${article.logged};
                </script>
                <div class="card-normal">
                    <section class="section">
                        <div class="container detail-container">
                            <div class="columns">
                                <#include "side.ftl">
                                <div  class="column is-12-tablet is-8-desktop is-8-widescreen is-8-fullhd has-order-2 column-main">
                                    <div class="card">
                                        <div class="card-content article card-wrap" style="width: 100%">
                                            <div class="card-wrap-img">
                                                <img src="${article.articleImg1URL}" ></img>
                                            </div>
                                            <div class="card-wrap-content">
                                                <div class="level article-meta is-size-7 is-uppercase is-mobile is-overflow-x-auto">
                                                    <div class="level-left">
                                                        <div class="level-item has-text-grey">
                                                            ${article.articleCategory}
                                                        </div>
                                                    </div>
                                                </div>
                                                <h1 class="title is-size-3 is-size-4-mobile has-text-weight-normal">
                                                    ${article.articleTitle}
                                                </h1>
                                                <style>
                                                    .content .emoji {
                                                        width: 25px !important;
                                                        height: 25px !important;
                                                    }
                                                </style>
                                                <div id="articleContent" class="content post-article">
                                                    ${article.articleContent}
                                                </div>
                                                <div id="jumpBtn" class="content post-article">项目官网</div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <#if interactive == "on">
                                    <div class="card">
                                        <div class="card-content">
                                            <h3 class="title is-5 has-text-weight-normal">评论</h3>
                                            <@comments commentList=articleComments article=article
                                                count=article.articleCommentCount>
                                            </@comments>
                                        </div>
                                    </div>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </section>
            </div>
            <a id="back-to-top" title="返回顶部" href="javascript:"><i class="fas fa-chevron-up"></i></a>
            <#include "footer.ftl">
            <@comment_script oId=article.oId commentable=article.commentable>
                <#if 0 !=randomArticlesDisplayCount>
                    page.loadRandomArticles('<h3>${randomArticlesLabel}</h3>');
                </#if>
                <#if 0 !=relevantArticlesDisplayCount>
                    page.loadRelevantArticles('${article.oId}', '<h3>${relevantArticlesLabel}</h3>');
                </#if>
                Skin.initArticle()
            </@comment_script>
            <script>
                // 延时检测右侧 “相关阅读” 是否为空，如果空则删除空 div，好看些
                $(function () {
                    var tempHtml =
                        '<a rel="nofollow" href="javascript:void(0)"><i class="fas fa-search fa-spin"></i> 努力寻找中 ...</a>';
                    $('#rArticles').append(tempHtml);
                    setTimeout(function () {
                        var judgeEmptyShowing = $('#rArticles').html();
                        judgeEmptyShowing = judgeEmptyShowing.replace(tempHtml, '');
                        $('#rArticles').html(judgeEmptyShowing);
                        judgeEmptyShowing = judgeEmptyShowing.replace(/[\r\n]/g,
                        "");
                        judgeEmptyShowing = judgeEmptyShowing.replace(new RegExp(
                            /( )/g), "");
                        if (judgeEmptyShowing === '') {
                            $('#rArticles').html(
                                '<a href="javascript:void(0)"><i class="fa fa-battery-empty"></i> 什么都没找到</a>'
                            );
                            setTimeout(function () {
                                $('#r2').fadeOut(1000);
                            }, 1000)
                        }
                    }, 3000)
                })
            </script>
            <script src='${servePath}/skins/${skinDirName}/js/events.js'></script>
        </body>
    </html>
