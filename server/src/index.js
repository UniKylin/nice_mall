const Koa = require('koa');
const Router = require('koa-router');

const app = new Koa();
const router = new Router();

router.get('/', (ctx, next) => {
  ctx.body = `<h1>Mock api index page...</h1>`
})

router.get('/api/focus', (ctx, next) => {
  ctx.body = {
    code: 0,
    result: [
      {
        id: 1,
        title: 'mac pro笔记本',
        pic: 'https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/111713/35/12643/277836/5f1356ccEbcbeaf9a/b79a2dcef2d6cc11.jpg!cr_1125x445_0_171!q70.jpg.dpg',
        price: 12000.00,
        status: 1,
        url: 'https://lps.jd.com/psp/66673485724?imup=ChcKETQ1MzQ0NDUwLTUzNjUxMTgxEgAYABITCJzPsrD4ARCM0e0EGgAgoAUoARimHCAAKiVtaXh0YWdfaSx1YSx4Z2EsZ2lhLGNpZCxmX2JhX2ZsX2w0OTM4MghtaXh0YWdfaTouCgzoi7nmnpzlsI_lhbUQxddgGAIgtOf5856F9d1yKKT2rnUwo_audTgDQICAIEqTAUl8TUlYVEFHX0lSLElfQV9GTF9MNjcyOCxJX0FfUkVfTEMsSV9BX1BMX1IsSV9BX1NMX1IsSV9VX0ZMX0w2NzU4LElfU19GTF9SLElfUl9GTF9SLElfUF9GTF9MQyxJX0dfWEdfUixJX0JfRkxfTDY3OTQsR0lBfDtGfE1JWFRBR19GUixGX0JBX0ZMX0w0OTM4fA&extension_id=eyJhZCI6IjM2MjIiLCJjaCI6IjIiLCJza3UiOiI2NjY3MzQ4NTcyNCIsInRzIjoiMTYwMDg2OTU5MCIsInVuaXFpZCI6IntcImNsaWNrX2lkXCI6XCI5YTY1NjhhOC1jM2YxLTRhYWItOTQ4Ny1hOGFlMTgwNDA1ZmZcIixcIm1hdGVyaWFsX2lkXCI6XCI4MjY3NDM0ODE3NTI4Njg5NTg4XCIsXCJwb3NfaWRcIjpcIjM2MjJcIixcInNpZFwiOlwiMzY3OGFlOTctY2UyZS00NzZlLWFiMWItYzZjYWI4Y2M5MTRhXCJ9In0%3D&jd_pop=9a6568a8-c3f1-4aab-9487-a8ae180405ff&abt=0',
      },
      {
        id: 2,
        title: '大疆直升机',
        pic: 'https://imgcps.jd.com/ling4/6689445/5pm66IO955Sf5rS7/6K6p55Sf5rS75pu0576O5aW9/p-5d91a4f642dd5b7c7d52cbde/b1089579/cr/s1125x690/q70.jpg',
        price: 12000.00,
        status: 1,
        url: 'https://h5.m.jd.com/active/yard-channel/index.html?themeId=8545&babelChannel=12539622&innerLink=%5B%7B%22matId%22%3A%226689445%22%7D%5D&themeStyle=0&__jda=76161171.15512399524611447084229.1551239952.1600662944.1600869384.190',
      },
      {
        id: 3,
        title: '大牌手表',
        pic: 'https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/125450/6/11500/118648/5f4e243aE1a004d07/7c1d0ae64356b12a.jpg!q70.jpg.dpg',
        price: 18000.00,
        status: 1,
        url: 'https://pro.m.jd.com/mall/active/job65pMdrU5DWwxtWdZQ8CZgDbW/index.html?extension_id=eyJhZCI6IjM2MjIiLCJjaCI6IjIiLCJzaG9wIjoiMTEyNTQwIiwidHMiOiIxNjAwODY5ODA5IiwidW5pcWlkIjoie1wiY2xpY2tfaWRcIjpcIjEwZTY5MzUwLWM4ODktNDI5Yy05MzhkLTY2YzA2NjI2ZWE1MlwiLFwibWF0ZXJpYWxfaWRcIjpcIjI1NTQxOTc3ODJcIixcInBvc19pZFwiOlwiMzYyMlwiLFwic2lkXCI6XCI5YjYxNDc5Ni1mNWQ2LTRjYWUtYWU2MC05YTI0ODI1NTk1ZjNcIn0ifQ==&jd_pop=10e69350-c889-429c-938d-66c06626ea52&abt=1',
      }
    ]
  }
});


router.get('/api/category', (ctx, next) => {
  ctx.body = {
    result: [
      {
        _id: "59f1e1ada1da8b15d42234e9",
        title: "电脑办公",
        status: 1,
        pic: "",
        pid: "0",
        sort: "100"
      },
      {
        _id: "59f1e1e880e7ed050cec999d",
        title: "女装内衣",
        status: 1,
        pic: "",
        pid: "0",
        sort: "100"
      },
      {
        _id: "59f1e4659bfd8f3bd030eed3",
        title: "运动户外",
        status: 1,
        pic: "",
        pid: "0",
        sort: "100"
      },
      {
        _id: "59f1e46e9bfd8f3bd030eed4",
        title: "手机数码",
        status: 1,
        pic: "",
        pid: "0",
        sort: "100"
      },
      {
        _id: "59f1e47e9bfd8f3bd030eed5",
        title: "化妆品",
        status: 1,
        pic: "",
        pid: "0",
        sort: "100"
      },
      {
        _id: "5a04251e010e711234661438",
        title: "箱包",
        status: 1,
        pic: "",
        pid: "0",
        sort: "100"
      },
      {
        _id: "5a04261e010e71123466143a",
        title: "女鞋",
        status: 1,
        pic: "",
        pid: "0",
        sort: "100"
      },
      {
        _id: "5a042e29010e711234661443",
        title: "汽车用品",
        status: 1,
        pic: "",
        pid: "0",
        sort: "100"
      },
      {
        _id: "5a042f27010e711234661446",
        title: "酒水饮料",
        status: 1,
        pic: "",
        pid: "0",
        sort: "100"
      }
    ]
  }
})

app
  .use(router.routes())
  .use(router.allowedMethods());

app.listen(9000, () => console.log(`>>> Mock server running at: http://127.0.0.1:9000`))