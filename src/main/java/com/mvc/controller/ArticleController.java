package com.mvc.controller;

import com.mvc.commons.paging.Criteria;
import com.mvc.commons.paging.PageMaker;
import com.mvc.commons.paging.SearchCriteria;
import com.mvc.domain.ArticleVO;
import com.mvc.service.ArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;

@Controller
@RequestMapping("/article")
public class ArticleController {

    private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
    private final ArticleService articleService;

    @Inject
    public ArticleController(ArticleService articleService) {
        this.articleService = articleService;
    }



   //등록 페이지 이동
    @RequestMapping(value="/write", method= RequestMethod.GET)
   public String writeGET(){

        logger.info("write GET...");

        return "/article/write";
   }

   //등록 처리
    @RequestMapping(value="/write", method=RequestMethod.POST)
    public String writePOST(ArticleVO articleVO, RedirectAttributes redirectAttributes)throws Exception{

        logger.info("write POST...");
        logger.info(articleVO.toString());
        articleService.create(articleVO);
        redirectAttributes.addFlashAttribute("msg","regSuccess");
        System.out.println("##><");

        return "redirect:/article/listPaging";
    }

    //목록 페이지 이동
    @RequestMapping(value="/list", method=RequestMethod.GET)
    public String list(Model model) throws Exception{

        logger.info("list ...");
       model.addAttribute("articles", articleService.listAll());

       return "/article/list";
    }


    /*
    //조회 페이지 이동
    @RequestMapping(value="/read", method=RequestMethod.GET)
    public String read(@RequestParam("articleNo") int articleNo, Model model) throws Exception{

        logger.info("read ...");
        model.addAttribute("article", articleService.read(articleNo));

        return "/article/read";
    }

     */


    /*
    //조회 페이지 이동(+목록페이지 정보 유지)
    @RequestMapping(value="/read", method=RequestMethod.GET)
    public String read(@RequestParam("articleNo") int articleNo, @ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{

            model.addAttribute("article",articleService.read(articleNo));
            return "/article/read";
    }

     */

    //조회 페이지 이동(+목록페이지 정보 유지) + 게시글 검색정보 유지
    @RequestMapping(value="/read", method=RequestMethod.GET)
    public String read(@RequestParam("articleNo") int articleNo, @ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model) throws Exception{

        logger.info("search read() called...");
        model.addAttribute("article",articleService.read(articleNo));
        return "/article/read";
    }

/*
    //수정 페이지 이동
    @RequestMapping(value="/modify", method = RequestMethod.GET)
    public String modifyGET(@RequestParam("articleNo") int articleNo, Model model) throws Exception{

        logger.info("modifyGet ...");
        model.addAttribute("article",articleService.read(articleNo));

        return "/article/modify";
    }

 */

    /*
    //수정페이지 이동(+목록페이지 정보 유지)
    @RequestMapping(value="/modify", method = RequestMethod.GET)
    public String modifyGET(@RequestParam("articleNo") int articleNo, @ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{

        logger.info("modifyGet ...");
        model.addAttribute("article",articleService.read(articleNo));

    return "/article/modify";
        }

     */


    //수정페이지 이동(+목록페이지 정보 유지) + 게시글 검색정보 유지
    @RequestMapping(value="/modify", method = RequestMethod.GET)
    public String modifyGET(@RequestParam("articleNo") int articleNo, @ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model) throws Exception{

        logger.info("modifyGet ...");
        logger.info(searchCriteria.toString());
        model.addAttribute("article",articleService.read(articleNo));

        return "/article/modify";
    }


/*
    //수정 처리
    @RequestMapping(value="/modify", method=RequestMethod.POST)
    public String modifyPOST(ArticleVO articleVO, RedirectAttributes redirectAttributes) throws Exception{

        logger.info("modifyPOST ...");
        articleService.update(articleVO);
        redirectAttributes.addFlashAttribute("msg","modSuccess");

        return "redirect:/article/list";
    }

 */

    /*
    //수정 처리(+목록페이지 정보 유지)
    @RequestMapping(value="/modify", method=RequestMethod.POST)
    public String modifyPOST(ArticleVO articleVO, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{

        logger.info("modifyPOST ...");
        articleService.update(articleVO);
        redirectAttributes.addAttribute("page",criteria.getPage());
        redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
        redirectAttributes.addFlashAttribute("msg","modSuccess");

        return "redirect:/article/listPaging";
    }

     */


    //수정 처리(+목록페이지 정보 유지) + 게시글 검색정보 유지
    @RequestMapping(value="/modify", method=RequestMethod.POST)
    public String modifyPOST(ArticleVO articleVO, SearchCriteria searchCriteria, RedirectAttributes redirectAttributes) throws Exception{

        logger.info("modifyPOST ...");
        articleService.update(articleVO);
        redirectAttributes.addAttribute("page",searchCriteria.getPage());
        redirectAttributes.addAttribute("perPageNum",searchCriteria.getPerPageNum());
        redirectAttributes.addAttribute("searchType",searchCriteria.getSearchType());
        redirectAttributes.addAttribute("keyword",searchCriteria.getKeyword());
        redirectAttributes.addFlashAttribute("msg","modSuccess");

        return "redirect:/article/listPaging";
    }


    /*
    //삭제 처리
    @RequestMapping(value="/remove", method=RequestMethod.POST)
    public String remove(@RequestParam("articleNo") int articleNo, RedirectAttributes redirectAttributes) throws Exception{

        logger.info("remove ...");
        articleService.delete(articleNo);
        redirectAttributes.addFlashAttribute("msg","delSuccess");

        return "redirect:/article/list";
    }

     */

    /*
    //삭제 처리(+목록페이지 정보 유지)
    @RequestMapping(value="/remove", method=RequestMethod.POST)
    public String remove(@RequestParam("articleNo") int articleNo, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{

        logger.info("remove ...");
        articleService.delete(articleNo);
        redirectAttributes.addAttribute("page",criteria.getPage());
        redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
        redirectAttributes.addFlashAttribute("msg","delSuccess");

        return "redirect:/article/listPaging";
    }

     */


    //삭제 처리(+목록페이지 정보 유지) + 게시글 검색정보 유지
    @RequestMapping(value="/remove", method=RequestMethod.POST)
    public String remove(@RequestParam("articleNo") int articleNo, SearchCriteria searchCriteria, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{

        logger.info("remove ...");
        articleService.delete(articleNo);
        redirectAttributes.addAttribute("page",searchCriteria.getPage());
        redirectAttributes.addAttribute("perPageNum",searchCriteria.getPerPageNum());
        redirectAttributes.addAttribute("searchType",searchCriteria.getSearchType());
        redirectAttributes.addAttribute("keyword",searchCriteria.getKeyword());
        redirectAttributes.addFlashAttribute("msg","delSuccess");

        return "redirect:/article/listPaging";
    }



    @RequestMapping(value="/listCriteria",method=RequestMethod.GET)
    public String listCriteria(Model model, Criteria criteria) throws Exception{

        logger.info("listCriteria...");
        model.addAttribute("articles",articleService.listCriteria(criteria));

        return "/article/list_criteria";
    }

    /*
   //페이징처리 구현
    @RequestMapping(value="/listPaging", method=RequestMethod.GET)
    public String listPaging(Model model, Criteria criteria) throws Exception{
        logger.info("listPaging...");

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(criteria);
        pageMaker.setTotalCount(articleService.countArticles(criteria));

        model.addAttribute("articles",articleService.listCriteria(criteria));
        model.addAttribute("pageMaker",pageMaker);

        return "/article/list_paging";
    }
     */

    /*
    //페이징처리 구현+하단 페이지
    @RequestMapping(value="/listPaging", method=RequestMethod.GET)
    public String listPaging(Model model, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
        logger.info("listPaging...");

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(criteria);
        pageMaker.setTotalCount(articleService.countArticles(criteria));

        model.addAttribute("articles",articleService.listCriteria(criteria));
        model.addAttribute("pageMaker",pageMaker);

        redirectAttributes.addAttribute("page",criteria.getPage());
        redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
        redirectAttributes.addFlashAttribute("msg","delSuccess");

        return "/article/list_paging";
    }
     */

    //페이징처리 구현+하단 페이지+검색
    @RequestMapping(value="/listPaging", method=RequestMethod.GET)
    public String listPaging(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model, RedirectAttributes redirectAttributes) throws Exception{
        logger.info("search listPaging...");

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(searchCriteria);
       // pageMaker.setTotalCount(articleService.countArticles(searchCriteria));
        pageMaker.setTotalCount(articleService.countSearchedArticles(searchCriteria));

        //model.addAttribute("articles",articleService.listCriteria(searchCriteria));
        model.addAttribute("articles",articleService.listSearch(searchCriteria));
        model.addAttribute("pageMaker",pageMaker);

        redirectAttributes.addAttribute("page",searchCriteria.getPage());
        redirectAttributes.addAttribute("perPageNum",searchCriteria.getPerPageNum());
        redirectAttributes.addFlashAttribute("msg","delSuccess");

        return "/article/list_paging";
    }

}