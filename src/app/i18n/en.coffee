angular.module 'landing'
  .config ($translateProvider) ->
    $translateProvider.preferredLanguage 'en'
    $translateProvider.translations 'en',

      menu:
        about: 'Our advantages'
        clients: 'Clients about us'
        feedback: 'Feedback'

      languageImg: """
        <img src="/assets/images/v2/slider/picture-eng.png" alt="PollToPay">
      """

      call_to_action: 'CONTACT US'

      block_1_title: 'Only real people'
      block_2_title: 'Effective traffic filtering'
      block_3_title: 'Up to 98% conversion in to action'
      block_4_title: 'Personal manager'

      block_1_text: 'For the first time in the history of online advertising, you can targeted for absolutely any criterion - by gender and age, to the size of the feet or hair color'
      block_2_text: 'Bots and irrelevant users - we will screen out them all, and you only get the traffic, which is 100% corresponds to your target audience'
      block_3_text: 'By filtering traffic, we give you only those customers who are really interested in your products or services!'
      block_4_text: 'Our staff will tell you about all the possibilities and advantages, will always answer your questions and help to make the placement easy and simple as possible'

      feedback: 'Start working with us right now!'
      slon: 'Get 100 leads for free!'


      form:
        messageSent: 'Your message has been sent successfully.'
        name:  'Your Name'
        company:  'Company name'
        email: 'Your Email'
        message: """
      Message
"""
        send: 'SEND'

      footer:
        copyright: '© PollToPay 2015. All rights reserved.'
        privacyPolicy: 'Privacy policy'

      testimonials:
        one:
          title: 'Senior analyst'
          work: 'RBC.research'
          text: """
            <b>PollToPay</b> is a useful tool for users of online research applications.
                <br/><br/>
                The undeniable advantages <b>PollToPay</b> - it is a huge user base of smartphones and tablets, the ability to create surveys using a complete set of programming tools and easy access to people from different social and demographic groups.
"""
        two:
          title: 'Igor Sokolov'
          work: 'CEO, Everesearch'
          text: """
            <b>PollToPay</b> - is a great tool that allows you to know the opinion of people.
                <br/><br/>
                We get results effectively, and they are great!
"""
        three:
          title: 'Pavel Pravdin'
          work: 'CEO, Iwpro.ru'
          text: """
            Innovation has always been an important criterion for us. The process from the start to the end of unique.
                <br/><br/>
                It is very convenient and easy tool.
"""
