import { EasyhiresPage } from './app.po';

describe('easyhires App', function() {
  let page: EasyhiresPage;

  beforeEach(() => {
    page = new EasyhiresPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
